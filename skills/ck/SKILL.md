---
name: ck
description: "Use for codebase memory via semantic/lexical/hybrid search."
---

ck (seek) guide for building and querying a codebase memory.

See `references/cli-usage.md` for a focused CLI workflow.

## When to use
- You need semantic search across a codebase ("find auth flow").
- You need hybrid search (regex + semantic) for high-signal results.
- You want JSONL output for agent pipelines.

## Inputs it expects
- Query text or regex.
- Target path(s) to index/search.
- Mode: `--sem`, `--lex`, `--hybrid`, or default regex.
- Optional: `--topk`, `--threshold`, `--jsonl`.

## Step-by-step method
1) Check status: `ck --status .`
2) Build index (optional prebuild): `ck --index .`
3) Semantic search: `ck --sem "error handling" src/`
4) Hybrid search: `ck --hybrid "auth" . --topk 10`
5) Agent-friendly output: `ck --jsonl --sem "login" src/`

## Common commands
- `ck "text" src/`
- `ck --sem "concept" src/`
- `ck --lex "phrase" src/`
- `ck --hybrid "regex or phrase" src/`
- `ck --jsonl --sem "query" src/`
- `ck --status .` / `ck --index .` / `ck --clean .`

## Output format requirements
- Prefer `--jsonl` for agent workflows.
- Use `--scores` when comparing semantic relevance.

## Related skills
- `rg` - exact regex search
- `fd` - scope file sets
- `jq` - post-process JSONL output

## Smoke test
- Run `ck --help` and `ck --status .` in a repo.
