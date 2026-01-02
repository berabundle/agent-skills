---
name: bun
description: "Use for Bun runtime, package management, project setup, and test/build workflows in JS/TS."
---

Bun CLI guide for JS/TS projects.

## When to use
- You need a fast JS/TS runtime or package manager.
- You need to install, add, remove, or update dependencies.
- You need to run package.json scripts or one-off CLIs.
- You need to create or scaffold a new JS/TS project.

## Inputs it expects
- Action: install, add, remove, update, run, test, build, create, init.
- Package name(s) or script name.
- Entry point or template name.
- Optional flags (watch, hot, filter, etc.).

## Step-by-step method
1) Confirm Bun is available: `bun --version`.
2) Install dependencies: `bun install`.
3) Add/remove deps:
   - `bun add <pkg>`
   - `bun remove <pkg>`
4) Run scripts or files:
   - `bun run <script>`
   - `bun <file.ts>`
5) Run one-off CLIs: `bunx <tool>`.
6) Tests/build:
   - `bun test`
   - `bun build <entry>`
7) Project setup:
   - `bun init`
   - `bun create <template>`

## Common commands
- `bun install`
- `bun add <pkg>` / `bun remove <pkg>` / `bun update <pkg>`
- `bun run <script>` / `bun <file>`
- `bunx <tool>`
- `bun test`
- `bun build <entry>`
- `bun init` / `bun create <template>`

## Related skills
- `just` - run project recipes
- `ts-debug` - typecheck/lint/test loops
- `frontend-design` - JS/TS UI work

## Smoke test
- Run `bun --version` and `bun --help`.
