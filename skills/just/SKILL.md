---
name: just
description: "Use for running project recipes from a Justfile."
metadata:
  short-description: "Run project tasks with just."
---

Execute project tasks defined in a Justfile.

## When to use
- The repo contains a `Justfile` with standard tasks.
- You need consistent run, build, or test commands.

## Inputs it expects
- Desired recipe name.
- Any recipe arguments or variables.
- Repo path if not in the project root.

## Step-by-step method
1) List recipes: `just --list`.
2) Run the requested recipe: `just <recipe> [args]`.
3) If variables are required, pass them as `KEY=VALUE`.
4) Summarize the result or output location.

## Common commands
- `just --list` show recipes.
- `just test` run tests.
- `just lint` run lint.
- `just build` build artifacts.

## Smoke test
- Run `just --version` and `just --list` in a repo with a Justfile.
