---
name: consult-llm
description: "Use when you are stuck and need an expert consultation from the other local agent (Codex or Claude) via CLI."
metadata:
  short-description: "Ask the other agent for a second opinion."
---

Consult the other local agent (Codex or Claude) using CLI calls and a structured prompt.

## When to use
- You are blocked or uncertain about a bug or design decision.
- You want a second opinion before making a risky change.
- One agent is stuck and the other is likely to help.

## Inputs it expects
- Target provider: `claude` or `codex` (use the other agent).
- Problem summary and current hypothesis.
- Relevant files, logs, and commands already tried.
- Specific questions the consultant should answer.

## Step-by-step method
1) Gather minimal context: relevant files, errors, and commands.
2) Draft a focused prompt using `references/consult-llm-prompt-template.md`.
3) Choose provider:
   - If you are Codex, consult Claude.
   - If you are Claude, consult Codex.
4) Run the CLI and require a strict markdown section format.
5) Summarize the response and decide next steps.

## Command templates
Set `SKILL_DIR` to the installed skill path.

### Claude consult (from Codex or shell)
```bash
SKILL_DIR=~/.codex/skills/consult-llm
PROMPT="$(cat $SKILL_DIR/references/consult-llm-prompt-template.md)"

claude --print --model sonnet --tools "" -- "$PROMPT"
```

### Codex consult (from Claude or shell)
```bash
SKILL_DIR=~/.claude/skills/consult-llm
PROMPT="$(cat $SKILL_DIR/references/consult-llm-prompt-template.md)"

codex exec --sandbox read-only --skip-git-repo-check "$PROMPT"
```

## Output format requirements
- Respond in markdown with these exact headings:
  - Summary
  - Analysis
  - Recommended next steps
  - Risks
  - Files to check
- Keep summaries concise and actionable.

## Examples
- "We keep getting a failing test in `src/api/client.ts`. Diagnose likely causes and propose fixes."
- "Review this diff and tell me if there are concurrency risks."

## Smoke test
- Run a consult command with a short prompt (for example, "Analyze a failed unit test with a null pointer and propose next steps") and confirm the headings are present.
