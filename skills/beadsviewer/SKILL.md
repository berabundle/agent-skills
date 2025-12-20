---
name: beadsviewer
description: "Use when you need to analyze Beads (.beads) issues with the bv Beads Viewer in robot mode for triage or planning."
metadata:
  short-description: "Analyze Beads issues with bv (robot mode)."
---

Guides use of Beads Viewer (`bv`) in non-interactive robot mode for issue triage and planning.

## When to use
- The repo uses Beads (`.beads/`) and you need structured triage or planning output.
- You want automated suggestions from `bv` without opening the TUI.

## Inputs it expects
- Repository path (or confirm current working directory).
- Desired robot action: `triage`, `plan`, or `next`.
- Any scope filters or context the user wants included.

## Step-by-step method
1) Confirm `.beads/` exists in the repo.
2) Ensure `bv` is available: `command -v bv`.
3) If missing and install is allowed, install using:
   `curl -fsSL "https://raw.githubusercontent.com/Dicklesworthstone/beads_viewer/main/install.sh?$(date +%s)" | bash`
4) Run only robot mode commands (non-interactive JSON):
   - `bv --robot-triage`
   - `bv --robot-plan`
   - `bv --robot-next`
5) Summarize the output and call out any recommended next actions.

## Output format requirements
- Do not launch the interactive TUI (`bv` with no flags).
- Return a concise summary of the robot output; include raw JSON only if asked.
- If installation was required, report that it was performed.

## Examples
```bash
bv --robot-triage
bv --robot-plan
bv --robot-next
```

## Smoke test
- Run `bv --robot-triage` in a repo with `.beads/` and verify JSON output.
