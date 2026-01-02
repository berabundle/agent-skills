---
name: web-iterate
description: "Use when you need an agentic loop to understand and improve a web UI by capturing rendered state, DOM, and interactives."
---

Agentic website capture loop for UI iteration.

## When to use
- You need the agent to see the rendered UI, not just source HTML.
- You need all JS to execute so the final DOM is visible.
- You need a machine-readable inventory of buttons/links/inputs.
- You want a repeatable capture loop to iterate UI changes.

## Inputs it expects
- `URL`: Page to capture (local dev server or deployed URL).
- `OUT_DIR`: Output directory for capture artifacts.
- `PAGE`: Persistent page name for the dev-browser session.
- `WIDTH` / `HEIGHT`: Viewport size.
- `WAIT_MS`: Extra settle time for SPA hydration or animations.
- `WATCH_ROOT`: Project root for watch mode (optional).

## Step-by-step method
1) Start the site (if local): run your dev server and confirm the URL.
2) Start the persistent browser:
   - `cd ~/Projects/berabundle/agent-skills/skills/dev-browser && ./server.sh &`
3) Run a capture:
   - `URL=http://localhost:3000 OUT_DIR=/tmp/web-capture ~/Projects/berabundle/agent-skills/skills/web-iterate/scripts/capture.sh`
4) Inspect outputs (UI + ARIA + DOM + JS-loaded assets) and propose changes.
5) Re-run capture after changes. For auto-refresh:
   - `cd /path/to/project && rg --files -g '!node_modules/**' -g '!dist/**' -g '!build/**' | entr -r ~/Projects/berabundle/agent-skills/skills/web-iterate/scripts/capture.sh`

## Output format requirements
- `ui.png`: Full-page rendered screenshot.
- `aria.yaml`: ARIA snapshot (buttons, links, inputs, headings).
- `dom.html`: Post-JS DOM snapshot.
- `console.json`: Console messages and page errors.
- `network.json`: Response list with status/resource type.
- `scripts.json`: Script tags discovered after hydration.
- `meta.json`: URL, title, timestamp, viewport.

## Related skills
- `dev-browser` - persistent browser
- `entr` - auto-run on file change
- `frontend-design` - visual QA
- `ck` - semantic search for UI components

## Smoke test
- Start dev-browser server.
- Run capture against `https://example.com` with `OUT_DIR=/tmp/web-capture`.
- Confirm `ui.png`, `aria.yaml`, and `dom.html` exist in `/tmp/web-capture`.
