# Command Line Interface Guidelines (clig.dev) - Summary

Source: clig.dev (Command Line Interface Guidelines).
This is a concise, practical summary for designing or reviewing CLIs.

## Core principles
- Human-first UX: clear messages, helpful defaults, predictable behavior.
- Composability: work well in pipelines and scripts.
- Sensible conventions: follow common flag names and exit code norms.

## Help and documentation
- Provide `-h`/`--help` for every command.
- Keep default help short; show examples and common flags first.
- Provide extended docs or `--help` sections for advanced detail.
- Make error messages point to help or docs when appropriate.

## Output
- Use stdout for main data, stderr for diagnostics.
- For non-TTY (pipes/redirect), avoid color and decoration.
- Provide machine-friendly output when needed (e.g., `--json`).
- Support `--quiet`/`--verbose` or similar verbosity controls.

## Errors
- Catch errors and provide actionable messages.
- Keep errors brief; include one clear remediation step if possible.
- Use consistent exit codes and document them.
- Avoid stack traces by default; offer `--debug`/`--verbose` to show more.

## Arguments and flags
- Prefer long, descriptive flags; add short aliases for common ones.
- Use standard flag names when possible (`--help`, `--version`, `--json`).
- Avoid surprising positional argument order; make defaults explicit.
- For destructive actions, require confirmation or a `--force` flag.
- Accept `-` as stdin or stdout where it makes sense.

## Interactivity
- Only prompt when interactive; never prompt in non-TTY mode.
- Provide a non-interactive mode (`--no-input`, `--yes`, `--force`).
- Do not echo secrets; use safe password prompts.

## Subcommands and structure
- Use subcommands when the tool has distinct verbs or workflows.
- Keep naming consistent across subcommands.
- Prefer predictable, shallow command trees over deeply nested ones.

## Configuration and environment
- Define a clear precedence: flags > env vars > config file > defaults.
- Use XDG locations on Linux when applicable.
- Keep env var names consistent and namespaced.
- Avoid storing secrets in plain env vars if possible; document safe options.

## Robustness and performance
- Validate inputs early and fail fast.
- If long-running, show progress or a status indicator.
- Make output stable so scripts do not break across versions.

## Versioning and compatibility
- Avoid breaking output formats; add new fields instead of renaming.
- Provide deprecation paths for behavior changes.

## Naming and discoverability
- Short, lowercase command names are easier to type and remember.
- Use clear nouns/verbs that match user intent.
