---
name: git
description: "Use for git workflows: status, diff, branch, commit, log, fetch/pull, merge, and rebase."
metadata:
  short-description: "Core git workflows."
---

Manage source control with standard git commands while avoiding destructive operations unless requested.

## When to use
- You need to inspect or update repo state.
- You need to manage branches, commits, or history.

## Inputs it expects
- Repository path if not in a repo.
- Desired action (status, diff, branch, commit, merge, rebase).
- Branch names or commit refs when relevant.

## Step-by-step method
1) Confirm repo context: `git status`.
2) Inspect changes with `git diff` or `git log` as needed.
3) Apply changes with `git add`, `git commit`, `git switch`, `git branch`.
4) Sync with remotes using `git fetch` or `git pull`.
5) Summarize the resulting state.

## Common commands
- `git status`, `git diff`, `git log --oneline --decorate`.
- `git add -p` for staging hunks.
- `git commit -m "..."` for commits.
- `git switch -c <branch>` to create/switch branches.
- `git fetch --all --prune` to sync refs.

## Output format requirements
- Report branch name and whether the working tree is clean.
- Avoid destructive commands (for example, `reset --hard`) unless explicitly requested.

## Related skills
- `gh` - GitHub issues/PRs

## Smoke test
- Run `git status` in a repo.
