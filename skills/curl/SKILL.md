---
name: curl
description: "Use for HTTP requests, downloads, and uploads with curl."
metadata:
  short-description: "HTTP requests with curl."
---

Make HTTP requests and transfer files with curl.

## When to use
- You need quick API calls or file downloads.
- You need to test endpoints from the CLI.

## Inputs it expects
- URL and HTTP method.
- Headers, body, or auth if needed.
- Output file path when saving responses.

## Step-by-step method
1) Start with a simple GET: `curl -sS URL`.
2) Add headers with `-H` and a body with `-d`.
3) Use `-f` to fail on HTTP errors and `-L` to follow redirects.
4) Save output with `-o` or `-O`.

## Common commands
- `curl -sS https://example.com`.
- `curl -sS -H "Accept: application/json" URL`.
- `curl -sS -X POST -d '{"a":1}' URL`.
- `curl -sS -o output.json URL`.

## Related skills
- `http` - readable API calls
- `jq` - inspect JSON responses
- `wget` - bulk downloads

## Smoke test
- Run `curl -sS https://example.com | head -n 1`.
