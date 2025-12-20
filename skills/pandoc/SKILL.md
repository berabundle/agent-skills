---
name: pandoc
description: "Use for converting documents between formats (HTML, Markdown, PDF) with pandoc."
metadata:
  short-description: "Document conversion with pandoc."
---

Convert documents between formats using pandoc.

## When to use
- You need to convert HTML to Markdown or vice versa.
- You need to batch convert docs with a single command.

## Inputs it expects
- Source file or URL.
- Input and output formats.
- Output file path.

## Step-by-step method
1) Identify input format (`-f`) and output format (`-t`).
2) Provide output with `-o`.
3) Use `-s` for standalone outputs when needed.

## Common commands
- `pandoc input.html -f html -t gfm -o output.md`.
- `pandoc input.md -f gfm -t html -o output.html`.
- `curl -sL URL | pandoc -f html -t gfm -o docs.md`.

## Smoke test
- Run `pandoc --version` and convert a small HTML file to Markdown.
