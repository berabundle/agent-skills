---
name: ssh
description: "Use for secure remote shell access, port forwarding, and quick remote checks over SSH."
---

SSH CLI guide for remote access and tunnels.

## When to use
- You need to connect to a remote server for admin or debugging.
- You need port forwarding to reach a private service.
- You need to run a one-off command remotely.

## Inputs it expects
- Host (IP or hostname) and optional user.
- SSH key path or agent availability.
- Port (default 22) if non-standard.
- Optional remote command or tunnel spec.

## Step-by-step method
1) Confirm access details (user, host, key, port).
2) Check key availability: `ssh-add -l` (if using agent).
3) Connect: `ssh user@host` (or `ssh -i ~/.ssh/key user@host`).
4) For one-off commands: `ssh user@host "command"`.
5) For port forward: `ssh -N -L 8080:127.0.0.1:8080 user@host`.

## Validation checklist
- Confirm host, user, and key are correct before connecting.
- If using a tunnel, verify the local port is free and the remote service is listening.
- Avoid running destructive commands without explicit confirmation.

## Related skills
- `hcloud` - provision and manage remote servers
- `tmux` - keep long-running remote sessions alive
- `git` - SSH keys often overlap with git auth

## Smoke test
- Run `ssh -V`.
