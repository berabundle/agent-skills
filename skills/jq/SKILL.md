---
name: jq
description: "Use for processing JSON on the command line with jq filters."
metadata:
  short-description: "JSON filtering with jq."
---

Transform and query JSON using jq filters.

## When to use
- You need to extract fields from JSON.
- You need to format, filter, or transform JSON data.

## Inputs it expects
- JSON source (file or stdin).
- Desired fields or transformations.
- Output format preferences (raw, compact).

## Step-by-step method
1) Inspect input with `jq '.'` to understand structure.
2) Select fields with `jq '.field'` or `jq '.items[] | .name'`.
3) Use `-r` for raw string output.
4) Use `-c` for compact output if needed.

## Common commands
- `jq '.' file.json` pretty-print.
- `jq -r '.items[].id' file.json` extract IDs.
- `jq -c '.items[]' file.json` stream items.
- `echo '{"a":1}' | jq '.a'` from stdin.

## Related skills
- `curl` - parse API output
- `http` - structured API calls
- `ck` - process JSONL results

## Smoke test
- Run `echo '{"a":1}' | jq '.a'`.
