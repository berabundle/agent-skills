---
name: tmux
description: "Use for managing terminal sessions with tmux."
metadata:
  short-description: "Terminal sessions with tmux."
---

Manage persistent terminal sessions with tmux.

## When to use
- You need multiple terminal sessions or panes.
- You want long-running tasks to survive disconnects.

## Inputs it expects
- Session name.
- Desired action (new, attach, list, kill).

## Step-by-step method
1) Create or attach: `tmux new -A -s <name>`.
2) List sessions: `tmux ls`.
3) Attach: `tmux attach -t <name>`.
4) Kill a session when done: `tmux kill-session -t <name>`.

## Common commands
- `tmux new -A -s work`.
- `tmux ls`.
- `tmux attach -t work`.
- `tmux kill-session -t work`.

## Related skills
- `dev-browser` - persistent browser server
- `entr` - watch loops

## Smoke test
- Run `tmux -V` and `tmux ls`.
