---
name: playwright
description: "Use for browser automation, testing, screenshots, and codegen with Playwright."
metadata:
  short-description: "Browser automation with Playwright."
---

Automate browsers and run web tests with Playwright.

## When to use
- You need to script browser actions or capture screenshots.
- You need to run Playwright tests or generate code.

## Inputs it expects
- Target URL or test path.
- Browser choice (chromium, firefox, webkit).
- Output file path for screenshots or reports.

## Step-by-step method
1) Ensure browsers are installed: `playwright install chromium`.
2) Use `playwright codegen URL` for quick script generation.
3) Use `playwright test` for automated test runs.
4) Use `playwright screenshot URL file.png` for quick captures.

## Common commands
- `playwright install chromium`.
- `playwright codegen https://example.com`.
- `playwright test`.
- `playwright screenshot https://example.com shot.png`.

## Related skills
- `dev-browser` - persistent sessions
- `web-iterate` - UI capture loop

## Smoke test
- Run `playwright --version` and `playwright screenshot https://example.com /tmp/example.png`.
