# ck CLI usage

This focuses on ck as a local CLI for building "codebase memory" via semantic and hybrid search.

## Quick start
- Build or refresh index: `ck --index .`
- Semantic query: `ck --sem "error handling" src/`
- Hybrid query: `ck --hybrid "auth" . --topk 10`
- JSONL for agent pipelines: `ck --jsonl --sem "login" src/`

## Recommended defaults for agent workflows
- Prefer `--jsonl` for machine-readable output.
- Use `--topk 10` and adjust `--threshold` for precision.
- Use `--full-section` when you want entire functions/classes instead of a single line match.

## Typical loops
- Index once, then query repeatedly:
  - `ck --index .`
  - `ck --sem "billing" src/`
  - `ck --sem "billing" src/ --scores --threshold 0.75`

- Combine regex + semantics for best recall:
  - `ck --hybrid "retry" src/ --topk 15`
  - `ck --hybrid "token" src/ --threshold 0.03`

## Maintenance
- Status: `ck --status .`
- Clean orphaned index files: `ck --clean-orphans .`
- Full clean: `ck --clean .`

## Output tips
- Use `--no-snippet` if you only want file paths/lines in JSONL.
- Use `--scores` when comparing relevance between queries.
