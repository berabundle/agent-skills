---
name: uv
description: "Use for fast Python environments and dependency management with uv."
---

uv CLI guide for Python envs and dependencies.

## When to use
- You need a fast virtualenv workflow.
- You need to install/sync Python dependencies.
- You need to run Python tools in isolated environments.

## Inputs it expects
- Project root or target path.
- Dependency source: `pyproject.toml` or `requirements.txt`.
- Action: venv, add/remove, sync, lock, compile, run tool.

## Step-by-step method
1) Confirm uv is available: `uv --version` and `uv --help`.
2) Create a virtualenv: `uv venv`.
3) If starting fresh, initialize a project: `uv init`.
4) Add or remove deps:
   - `uv add <package>`
   - `uv remove <package>`
5) Sync the environment from the lockfile: `uv sync`.
6) Compile requirements from pyproject (pip-compatible):
   - `uv pip compile -o requirements.txt pyproject.toml`
7) Run tools in the env:
   - `uv run <command>`
8) Pip-compat installs (fallback):
   - `uv pip install -r requirements.txt`
   - `uv pip sync requirements.txt`

## Common commands
- `uv venv`
- `uv init`
- `uv add <package>` / `uv remove <package>`
- `uv sync`
- `uv lock`
- `uv pip compile -o requirements.txt pyproject.toml`
- `uv run <command>`

## Related skills
- `just` - task runner
- `bun` - JS toolchain alongside Python

## Smoke test
- Run `uv --version` and `uv --help`.
