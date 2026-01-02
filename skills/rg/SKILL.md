---
name: rg
description: "Use for fast project search with ripgrep (rg)."
metadata:
  short-description: "Fast code search with rg."
---

Search files quickly using ripgrep with regex or literal matches.

## When to use
- You need to find text across a codebase.
- You need to list files or filter by globs.

## Inputs it expects
- Search pattern (literal or regex).
- Optional path or file globs.
- Case sensitivity or file-type constraints.

## Step-by-step method
1) Start with a broad search: `rg "pattern"`.
2) Narrow with globs: `rg "pattern" -g "*.ts"`.
3) Use `-i` for case-insensitive searches.
4) Use `rg --files` to list files and pipe into other tools.

## Common commands
- `rg "term"` search.
- `rg -n "term"` include line numbers.
- `rg -g "*.md" "term"` limit by glob.
- `rg --files -g "*.py"` list files.

## Related skills
- `fd` - limit file sets
- `fzf` - interactive selection
- `ck` - semantic search

## Smoke test
- Run `rg --version` and `rg "TODO" .` in a repo.
