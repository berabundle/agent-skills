---
name: ideate
description: "Use when a user brings a new product or feature idea and wants collaborative ideation into a concrete plan, then execution via beads with implementation, comprehensive testing, and iteration (mirroring the selfimprove execution cycle)."
---

Turn a rough idea into a concrete plan, then execute with beads and a full test cycle.

## Default behavior
- Start with ideation and clarification questions.
- Enable beads workflow and create tasks by default when `.beads/` exists; initialize beads if missing.
- Autofix issues during implementation.
- Run the smallest meaningful check after implementation.
- Do not commit; provide commit suggestions only.

## Inputs it expects
- The idea or problem statement.
- Target users and intended outcomes (or permission to ask).
- Constraints (time, budget, stack, compliance).
- Repo context and current state.

## Step-by-step method
1) Read `AGENTS.md` and project docs; honor local rules and tooling.
2) Detect `.beads/` and prepare to use `bd`; if missing, initialize beads automatically.
3) Load `references/prompt-chain.md` and follow the chain in order.
4) Ask concise clarification questions when required; wait for answers before finalizing the plan.
5) Convert the ideation output into beads with dependencies, then execute in order.
6) After implementation, run the smallest meaningful check after each bead so the change works before moving on.
7) Finish with a fresh-eyes pass and summarize changes; do not commit.

## Output format requirements
- Provide an ideation summary with goals, non-goals, and assumptions.
- List beads tasks created or updated with IDs and statuses.
- List key changes with file paths and brief rationale.
- Report tests or checks run.
- Provide a commit grouping suggestion without performing commits.

## Related skills
- `beads` - task tracking
- `selfimprove` - execution loop
- `consult-llm` - second opinion
- `ck` - scan codebase quickly

## Smoke test
- Verify `~/Projects/berabundle/agent-skills/skills/ideate/SKILL.md` exists with YAML `name` and `description`.
- Verify `~/Projects/berabundle/agent-skills/skills/ideate/references/prompt-chain.md` exists.
