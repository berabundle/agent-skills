---
name: gh
description: "Use for GitHub CLI tasks: auth, repo browsing, issues, pull requests, releases, and workflows."
metadata:
  short-description: "GitHub CLI workflows."
---

Operate GitHub from the CLI using `gh` for auth, repo, issue, and PR workflows.

## When to use
- You need to interact with GitHub (issues, pull requests, releases, workflows).
- You want authenticated API calls without manual tokens.

## Inputs it expects
- Target repo (owner/name) if not in a repo.
- Desired action (list, create, view, edit, close, merge).
- Any labels, assignees, reviewers, or milestones.

## Step-by-step method
1) Confirm authentication: `gh auth status` (or `gh auth login`).
2) Confirm repo context: `gh repo view` or use `-R owner/repo`.
3) Run the requested operation with `gh issue`, `gh pr`, or `gh repo` subcommands.
4) Summarize results and include URLs or IDs.

## Common commands
- `gh repo view -w` open repo in browser.
- `gh issue list`, `gh issue create` manage issues.
- `gh pr list`, `gh pr view`, `gh pr create`, `gh pr merge` manage PRs.
- `gh run list`, `gh workflow view` inspect Actions.
- `gh api` for custom API calls.

## Output format requirements
- Report created/updated issue or PR numbers.
- Include links when available.

## Smoke test
- Run `gh --version` and `gh auth status`.
