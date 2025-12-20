---
name: fd
description: "Use for fast file and directory discovery with fd."
metadata:
  short-description: "Find files quickly with fd."
---

Find files and directories with `fd` using regex or glob patterns.

## When to use
- You need to locate files quickly by name.
- You want a faster alternative to `find`.

## Inputs it expects
- Pattern (regex by default, glob with `--glob`).
- Optional search root path.
- Optional type filters (file or directory).

## Step-by-step method
1) Start with a pattern: `fd "pattern"`.
2) Limit scope with a path: `fd "pattern" src`.
3) Use `-t f` for files or `-t d` for directories.
4) Use `-H` to include hidden files when needed.

## Common commands
- `fd "config"` search names.
- `fd -t f ".env"` find files.
- `fd -t d "tests"` find directories.
- `fd --glob "*.md" docs` glob search.

## Smoke test
- Run `fd --version` and `fd "README" .`.
