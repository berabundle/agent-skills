---
name: wget
description: "Use for downloading files or mirroring sites with wget."
metadata:
  short-description: "File downloads with wget."
---

Download files or mirror sites using wget.

## When to use
- You need to fetch files non-interactively.
- You need to mirror documentation sites.

## Inputs it expects
- URL or list of URLs.
- Output path or mirror options.
- Retry or resume preferences.

## Step-by-step method
1) Download a file: `wget URL`.
2) Save to a specific path with `-O`.
3) Mirror a site with `--mirror --convert-links --adjust-extension --no-parent`.
4) Resume downloads with `-c` when needed.

## Common commands
- `wget https://example.com/file.zip`.
- `wget -O docs.html https://example.com/docs`.
- `wget --mirror --convert-links --adjust-extension --no-parent https://example.com/docs/`.
- `wget -c https://example.com/bigfile.bin`.

## Related skills
- `curl` - quick fetches
- `lynx` - text dumps
- `pandoc` - convert docs

## Smoke test
- Run `wget -O - https://example.com | head -n 1`.
