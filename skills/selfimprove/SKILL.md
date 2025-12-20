---
name: selfimprove
description: "Daily self-improvement autopilot for software projects. Use when the user wants ongoing polish, random code exploration and bug-fixing, review of other agents' code, UX/quality audits, beads planning/execution, or a chained workflow that hands off ultrathink prompts to Claude Code then continues in Codex."
---

Run a chained self-improvement pass with beads default on, autofix enabled, and manual commits.

## Default behavior
- Enable beads workflow and create tasks by default; initialize beads if missing.
- Autofix issues rather than only reporting them.
- Hand off ultrathink prompts to Claude Code via CLI, then continue in Codex.
- Do not commit; provide commit suggestions only.

## Inputs it expects
- Repo root (current working directory).
- Optional scope limits (subsystem, folder, or feature).
- Whether to include the UX audit pass.
- Any time or depth constraints.

## Step-by-step method
1) Read `AGENTS.md` and project docs; honor local rules and tooling.
2) Detect `.beads/` and prepare to use `bd` for task tracking; if missing, initialize beads automatically.
3) Load `references/prompt-chain.md` and follow the chain in order, defaulting to all steps.
4) For each Claude Code step, extract the prompt from `references/prompt-chain.md` and run the Claude CLI; capture the output and continue without user intervention.
5) For each Codex step, do the analysis, implement fixes, and run the smallest meaningful check after each bead so the change works before moving on.
6) When generating beads, create granular tasks with dependencies, update statuses as work progresses, and run `bd sync`.
7) Finish with a fresh-eyes pass and summarize changes; do not commit.

## Claude Code command template
Set `SKILL_DIR` to the installed path (`~/.codex/skills/selfimprove`). Use the markers in
`references/prompt-chain.md` to extract the exact prompt.

### Review other agents' code
```bash
SKILL_DIR=~/.codex/skills/selfimprove
PROMPT="$(awk '/CLAUDE:review_agents:start/{flag=1;next}/CLAUDE:review_agents:end/{flag=0}flag' \
  "$SKILL_DIR/references/prompt-chain.md")"

claude --print --model sonnet --tools "" -- "$PROMPT"
```

### Commit/push (opt-in only)
```bash
SKILL_DIR=~/.codex/skills/selfimprove
PROMPT="$(awk '/CLAUDE:commit_push:start/{flag=1;next}/CLAUDE:commit_push:end/{flag=0}flag' \
  "$SKILL_DIR/references/prompt-chain.md")"

claude --print --model sonnet --tools "" -- "$PROMPT"
```

## Output format requirements
- List key changes with file paths and brief rationale.
- List beads tasks created or updated with IDs and statuses.
- Report tests or checks run.
- Provide a commit grouping suggestion without performing commits.

## Smoke test
- Verify `~/Projects/agent-skills/skills/selfimprove/SKILL.md` exists with YAML `name` and `description`.
- Verify `~/Projects/agent-skills/skills/selfimprove/references/prompt-chain.md` exists.
