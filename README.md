# agent-skills

Single source of truth for agent skills used by Claude Code and Codex CLI.

## Layout
- `skills/<skill-name>/SKILL.md` is the canonical skill definition.
- Optional folders: `references/`, `scripts/`, `assets/`.
- Use lowercase names with numbers and hyphens only.

## Install or sync skills
From this repo:

```bash
./bin/skill-sync list
./bin/skill-sync install --user
./bin/skill-sync install --repo /path/to/your/project
./bin/skill-sync install --codex-system
./bin/skill-sync doctor
```

Notes:
- Installs to `~/.claude/skills` and `~/.codex/skills` for user scope.
- Repo installs go to `<path>/.claude/skills` and `<path>/.codex/skills`.
- System install targets `/etc/codex/skills` (requires sudo).
- Uses symlinks when possible and falls back to copies.

## Creating new skills
Use the `skill-forge` meta-skill at `skills/skill-forge/SKILL.md` to generate new skills
from a local CLI or a GitHub repository.
