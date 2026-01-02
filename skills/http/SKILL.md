---
name: http
description: "Use for HTTP requests with HTTPie (http command)."
metadata:
  short-description: "HTTPie requests."
---

Make readable HTTP requests with HTTPie using the `http` command.

## When to use
- You need simple API calls with clean syntax.
- You want structured output without manual formatting.

## Inputs it expects
- URL and optional method.
- Headers, query params, or JSON body.
- Auth credentials if required.

## Step-by-step method
1) Run a basic request: `http URL`.
2) Add method explicitly if needed: `http POST URL`.
3) Use `key=value` for JSON fields and `key==value` for query params.
4) Add headers as `Header:Value`.

## Common commands
- `http :3000` shorthand for localhost.
- `http GET https://api.example.com`.
- `http POST https://api.example.com name=alice role=admin`.
- `http https://api.example.com search==term`.

## Related skills
- `curl` - fallback for complex flows
- `jq` - JSON filtering

## Smoke test
- Run `http :3000` against a local service or `http https://httpbin.org/get`.
