---
name: cli-guidelines
description: "Design or review command-line interfaces using clig.dev best practices. Use when asked about CLI UX, help/usage text, flags, subcommands, output formatting, error messages, interactivity, config/env precedence, exit codes, or naming."
---

Provide a concise, human-first CLI spec or review based on clig.dev.

## Scope
- New CLI design or redesign
- Help/usage text and examples
- Flags, subcommands, and naming choices
- Output formatting (human vs machine)
- Error handling and exit codes
- Interactivity and prompts
- Config files and environment variables

## Inputs it expects
- CLI goal and audience
- Target OS/platforms
- Existing command names (if any)
- Required outputs or formats (text/JSON/etc.)
- Any constraints (backward compatibility, scripts, piping)

## Step-by-step method
1) Collect intent, audience, and primary workflows.
2) Draft commands/subcommands, flags, and defaults.
3) Apply clig.dev guidelines for help, output, errors, and interactivity.
4) Specify config/env precedence and file locations.
5) Produce a compact CLI spec with examples and exit codes.
6) Run the validation checklist.

## Output format requirements
- CLI synopsis with commands/subcommands and core flags
- Help/usage text outline with 1-3 examples
- Output strategy: stdout vs stderr, human vs machine, and TTY behavior
- Error strategy: messages, exit codes, and remediation hints
- Config/env precedence and locations

## Validation checklist
- Help is short by default and includes examples.
- Flags are conventional and consistent across commands.
- stdout is for data; stderr is for diagnostics.
- Non-TTY output is stable and script-friendly.
- Prompts are disabled or avoided when non-interactive.
- Destructive actions are confirmed or require a flag.
- Exit codes are consistent and documented.
- Config/env precedence is explicit.

## Related skills
- `ideate` - brainstorm alternative CLI flows and naming options
- `consult-llm` - get a second opinion on UX tradeoffs
- `selfimprove` - iterate on the spec after feedback

## Smoke test
- Given a simple command, produce a one-page spec with commands, flags, examples, output, errors, and config precedence.

## References
- `references/clig-guidelines.md` - distilled guidance from clig.dev
