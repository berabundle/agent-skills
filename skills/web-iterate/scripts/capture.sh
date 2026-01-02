#!/usr/bin/env bash
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DEV_BROWSER="$ROOT/../dev-browser"

URL="${URL:-http://localhost:3000}"
OUT_DIR="${OUT_DIR:-$ROOT/tmp/capture}"
PAGE="${PAGE:-agentic}"
WIDTH="${WIDTH:-1280}"
HEIGHT="${HEIGHT:-800}"
WAIT_MS="${WAIT_MS:-0}"

mkdir -p "$OUT_DIR"

if [[ ! -d "$DEV_BROWSER" ]]; then
  echo "dev-browser not found at $DEV_BROWSER" >&2
  exit 1
fi

cd "$DEV_BROWSER"

OUT_DIR="$OUT_DIR" URL="$URL" PAGE="$PAGE" WIDTH="$WIDTH" HEIGHT="$HEIGHT" WAIT_MS="$WAIT_MS" npx tsx <<'TSX'
import { connect, waitForPageLoad } from "@/client.js";
import { mkdirSync, writeFileSync } from "fs";
import { join } from "path";

const url = process.env.URL ?? "http://localhost:3000";
const outDir = process.env.OUT_DIR ?? "tmp/agentic";
const pageName = process.env.PAGE ?? "agentic";
const width = Number(process.env.WIDTH ?? "1280");
const height = Number(process.env.HEIGHT ?? "800");
const waitMs = Number(process.env.WAIT_MS ?? "0");

mkdirSync(outDir, { recursive: true });

const client = await connect();
const page = await client.page(pageName);

page.removeAllListeners("console");
page.removeAllListeners("pageerror");
page.removeAllListeners("response");

const consoleEvents: Array<{ type: string; text: string }> = [];
const networkEvents: Array<{
  url: string;
  status: number;
  ok: boolean;
  resourceType: string;
}> = [];

page.on("console", (msg) => {
  consoleEvents.push({ type: msg.type(), text: msg.text() });
});
page.on("pageerror", (err) => {
  consoleEvents.push({ type: "pageerror", text: err.message });
});
page.on("response", (response) => {
  const req = response.request();
  networkEvents.push({
    url: response.url(),
    status: response.status(),
    ok: response.ok(),
    resourceType: req.resourceType(),
  });
});

await page.setViewportSize({ width, height });
await page.goto(url, { waitUntil: "domcontentloaded" });
await waitForPageLoad(page);
if (waitMs > 0) {
  await page.waitForTimeout(waitMs);
}

const snapshot = await client.getAISnapshot(pageName);
const html = await page.content();
const title = await page.title();
const scripts = await page.evaluate(() =>
  Array.from(document.scripts).map((s) => ({
    src: s.src || null,
    type: s.type || null,
    async: s.async,
    defer: s.defer,
  }))
);

await page.screenshot({ path: join(outDir, "ui.png"), fullPage: true });

writeFileSync(join(outDir, "aria.yaml"), snapshot, "utf8");
writeFileSync(join(outDir, "dom.html"), html, "utf8");
writeFileSync(join(outDir, "console.json"), JSON.stringify(consoleEvents, null, 2), "utf8");
writeFileSync(join(outDir, "network.json"), JSON.stringify(networkEvents, null, 2), "utf8");
writeFileSync(join(outDir, "scripts.json"), JSON.stringify(scripts, null, 2), "utf8");
writeFileSync(
  join(outDir, "meta.json"),
  JSON.stringify(
    {
      url,
      title,
      capturedAt: new Date().toISOString(),
      viewport: { width, height },
    },
    null,
    2
  ),
  "utf8"
);

console.log(`Captured ${url}`);
console.log(`Output: ${outDir}`);

await client.disconnect();
TSX
