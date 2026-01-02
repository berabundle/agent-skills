---
name: docker
description: "Use for building, running, and inspecting containers with Docker or docker compose."
---

Docker CLI guide for container workflows.

## When to use
- You need to build or run a container locally.
- You need to debug or inspect running containers.
- You need to use docker compose to orchestrate services.

## Inputs it expects
- Image name/tag or Dockerfile path.
- Ports and volume mounts.
- Compose file path or service names.

## Step-by-step method
1) Confirm Docker is installed and daemon is running: `docker version` and `docker info`.
2) List running containers: `docker ps`.
3) Build an image: `docker build -t name:tag .`.
4) Run a container: `docker run --rm -p 8080:8080 name:tag`.
5) Use compose: `docker compose up -d` and `docker compose logs -f`.

## Validation checklist
- Confirm you are in the correct repo/context before `build` or `compose up`.
- Verify exposed ports and volume mounts to avoid overwriting data.
- Avoid destructive commands (`docker system prune`, `docker rm -f`) without explicit approval.

## Related skills
- `hcloud` - deploy or manage remote hosts
- `tmux` - keep long-running compose sessions alive
- `curl` - health-check services after startup

## Smoke test
- Run `docker version` and `docker ps`.
