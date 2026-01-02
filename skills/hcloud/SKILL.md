---
name: hcloud
description: "Use when you need to provision or manage Hetzner Cloud resources via the hcloud CLI (contexts, servers, images, server types, SSH keys, firewalls, networks, volumes), especially for Debian/Ubuntu VPS setup." 
---

Operate Hetzner Cloud from the terminal using `hcloud` with safe, repeatable workflows.

## When to use
- You need to create, configure, or delete Hetzner Cloud servers.
- You need to manage SSH keys, firewalls, networks, or volumes.
- You need to list images, server types, locations, or existing resources.

## Inputs it expects
- Active Hetzner project context name.
- Desired server name, image, type, and location/datacenter.
- SSH key name (or a public key file to upload).
- Optional: firewall rules, network IDs, volume IDs, user-data file.

## Step-by-step method
1) Confirm the active context and account/project.
2) Gather required inputs (name, image, type, location, ssh key).
3) Use read-only list commands to validate inputs.
4) Create or update resources with explicit confirmation.
5) Capture outputs (IDs, IPs, fingerprints) for follow-up steps.
6) For destructive actions, double-check targets before executing.

## Command templates
Set context and verify:
```bash
hcloud context list
hcloud context use <context>
```

List key options:
```bash
hcloud image list
hcloud server-type list
hcloud location list
```

Register an SSH key:
```bash
hcloud ssh-key create --name <key-name> --public-key-from-file <path>
```

Create a server (no dry-run support):
```bash
hcloud server create \
  --name <name> \
  --image <image> \
  --type <server-type> \
  --ssh-key <key-name>
```

Delete a server (confirm intent first):
```bash
hcloud server delete <server-name-or-id>
```

## Output format requirements
- Summarize the action taken and the resulting IDs/IPs.
- List any commands executed and any required follow-ups.
- Call out destructive actions explicitly.

## Related skills
- `tmux` - keep long-running sessions alive
- `http` - API checks if needed

## Smoke test
- Run `hcloud version` and `hcloud context list` to confirm CLI access.
- Run `hcloud server-type list` to confirm API connectivity.

## References
- See `references/hcloud-workflows.md` for extended workflows and safety notes.
