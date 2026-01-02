---
name: skill-forge
description: "Use when asked to create a new skill from a local CLI tool or a GitHub repo; outputs a skill folder in $AGENT_SKILLS_ROOT/skills/<skill-name>."
metadata:
  short-description: "Create new skills from local CLIs or GitHub repos."
---

Builds new skills from a local program or a GitHub repository using a consistent, minimal SKILL.md format.

## Skill quality checklist
- The description includes explicit trigger phrases (what should cause the skill to fire).
- The workflow has at least one validation checkpoint (a MUST step when appropriate).
- The skill links to 2-4 related skills in a `## Related skills` section.
- Longer guidance is moved to `references/` and linked from the main file.

## When to use
- You need to create a new skill and can inspect a local CLI (`--help`, `--version`, workflows).
- You need to create a new skill from a GitHub repo (README, docs/, examples/, install scripts).

## Inputs it expects
- Source type: `local-cli` or `github-repo`.
- Name of the tool or repo URL.
- Any required version or target OS constraints.
- Expected user intent: what triggers the skill and what outcomes matter.
- Optional: paths to docs or examples to include under `references/`.

## Step-by-step method
1) Identify the trigger and scope from the user request.
2) Gather evidence:
   - Local CLI: run `<tool> --help` and `<tool> --version` and capture core commands and flags.
   - GitHub repo: read `README.md`, `docs/`, `examples/`, and install scripts for workflows.
3) Define the skill name (lowercase, numbers, hyphens only, <= 64 chars).
4) Set `AGENT_SKILLS_ROOT` to the repo root (for example, `~/Projects/berabundle/agent-skills`).
5) Create the folder at `$AGENT_SKILLS_ROOT/skills/<skill-name>`.
6) Write `SKILL.md` with a short top section, then details and a Smoke test section.
7) Add a `## Related skills` section and include a brief reason for each link.
8) Add a `## Validation checklist` (or equivalent) for workflows that can fail silently.
9) Add optional `references/` files for longer docs and link to them from `SKILL.md`.
10) Verify structure and that the skill explains inputs, steps, and outputs clearly.

## Output format requirements
- Path: `$AGENT_SKILLS_ROOT/skills/<skill-name>/`.
- Required file: `SKILL.md` with YAML frontmatter `name` + `description`.
- Optional folders: `references/`, `scripts/`, `assets/`.
- Include a `Validation checklist` section for complex workflows.
- Include a `Related skills` section with short reasons.
- Include a `Smoke test` section in `SKILL.md`.
- Keep the top of `SKILL.md` short and use progressive disclosure via links.

## Template snippet
```md
---
name: <skill-name>
description: "Use when ... (trigger goes here)."
---

One-line purpose of the skill.

## When to use
- ...

## Inputs it expects
- ...

## Step-by-step method
1) ...

## Output format requirements
- ...

## Validation checklist
- ...

## Related skills
- `consult-llm` - second opinion on scope
- `selfimprove` - periodic skill audits

## Smoke test
- ...
```

## Examples
### Example 1: GitHub repo
Input:
- Source type: `github-repo`
- Repo: `https://github.com/sharkdp/bat`
- Trigger: "Need a skill that teaches how to install and use bat"

Actions:
- Read `README.md` and `doc/`.
- Extract install commands, common flags, and examples.
- Create `$AGENT_SKILLS_ROOT/skills/bat-cli/` with `SKILL.md` and a short reference note.

Expected output:
- A `bat-cli` skill with a clear trigger, install steps, usage examples, and a Smoke test.

### Example 2: Local CLI
Input:
- Source type: `local-cli`
- Tool: `rg`
- Trigger: "Need a skill for fast project search"

Actions:
- Run `rg --help` and `rg --version`.
- Capture core options like `-g`, `-i`, and `--files`.
- Create `$AGENT_SKILLS_ROOT/skills/ripgrep/` with `SKILL.md`.

Expected output:
- A `ripgrep` skill that documents common search patterns and a Smoke test.

## Smoke test
- Create a dummy skill with this template and verify the folder exists under `$AGENT_SKILLS_ROOT/skills/`.
- Confirm `SKILL.md` has YAML frontmatter with `name` and `description`.
