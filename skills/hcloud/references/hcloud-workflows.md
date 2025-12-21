# hcloud workflows

Use these as building blocks. Keep changes minimal and confirm before creating or deleting billable resources.

## Contexts and tokens
- `hcloud context create <name>` prompts for a token.
- `hcloud context create --token-from-env <name>` uses `HCLOUD_TOKEN`.
- Config path: `~/.config/hcloud/cli.toml` (override with `--config`).

## Common read-only checks
```bash
hcloud context list
hcloud image list
hcloud server-type list
hcloud location list
hcloud ssh-key list
hcloud server list
```

## Create a server with cloud-init
```bash
hcloud server create \
  --name <name> \
  --image ubuntu-22.04 \
  --type cpx11 \
  --ssh-key <key-name> \
  --user-data-from-file <cloud-init.yaml>
```

## Add a firewall and attach to a server
```bash
hcloud firewall create --name <fw-name>
hcloud firewall add-rule <fw-name> --direction in --protocol tcp --port 22 --source-ips 0.0.0.0/0
hcloud firewall apply-to-resource <fw-name> --type server --server <server-name-or-id>
```

## Basic server lifecycle
```bash
hcloud server create --name <name> --image ubuntu-22.04 --type cpx11 --ssh-key <key-name>
hcloud server describe <name>
hcloud server poweroff <name>
hcloud server poweron <name>
hcloud server reboot <name>
hcloud server delete <name>
```

## Notes
- `hcloud server create` has no `--dry-run` flag; use list commands to validate inputs.
- Prefer `--location` or `--datacenter` to control placement explicitly.
