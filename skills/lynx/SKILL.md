---
name: lynx
description: "Use for quick text dumps of web pages with lynx."
metadata:
  short-description: "Text-only web dumps with lynx."
---

Fetch text-only page dumps with lynx for quick inspection.

## When to use
- You need a plain-text view of a web page.
- You want to save a quick docs snapshot without rendering.

## Inputs it expects
- URL to fetch.
- Output file path if saving.

## Step-by-step method
1) Dump a page to stdout: `lynx -dump URL`.
2) Remove link lists and numbering with `-nolist -nonumbers`.
3) Redirect output to a file when needed.

## Common commands
- `lynx -dump https://example.com`.
- `lynx -dump -nolist -nonumbers https://example.com > docs.txt`.

## Smoke test
- Run `lynx -dump https://example.com | head -n 5`.
