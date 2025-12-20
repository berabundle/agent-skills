---
name: beads
description: "Use when a repo has .beads and you need to manage tasks with the bd CLI (create, update, dependencies, sync)."
metadata:
  short-description: "Manage Beads tasks with bd."
---

Guides task tracking in Beads using the `bd` CLI with dependency-aware workflows.

## When to use
- The repo contains a `.beads/` directory and tasks should be tracked with `bd`.
- You need to create, update, or sync issues and dependencies.

## Inputs it expects
- Repository path (or confirm current working directory).
- Desired action: list/ready/create/show/update/close/dep/sync.
- Issue IDs, titles, and priorities.
- Target status values (for example: `open`, `in_progress`, `blocked`, `closed`).

## Step-by-step method
1) Confirm `.beads/` exists in the repo.
2) Inspect current work with `bd status` or `bd ready`.
3) Apply the requested change:
   - Create: `bd create "Title" -p <priority>` or `bd q "Title"`.
   - Show: `bd show <id>`.
   - Update status: `bd update <id> --status <status>`.
   - Add dependency: `bd dep add <child> <parent>`.
   - Close: `bd close <id>`.
4) After changing issues, run `bd sync` to export `.beads/issues.jsonl` (if configured).
5) Summarize what changed and report any new IDs.

## Quick command map
- `bd ready` shows unblocked work.
- `bd list` filters by status, label, or text.
- `bd comment <id> "..."` records notes.
- `bd dep add <child> <parent>` links dependencies.
- `bd sync` exports and syncs changes.

## Output format requirements
- Capture created IDs and report them back.
- Confirm `bd sync` ran if issues were modified.
- Keep outputs concise; use `--json` only if explicitly requested.

## Smoke test
- Run `bd status` in a repo with `.beads/`.
- Run `bd ready` to ensure the CLI can read issues.
