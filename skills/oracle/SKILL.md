---
name: oracle
description: "Use when you need to bundle prompts + files and consult an external model via the Oracle CLI (API or browser)."
metadata:
  short-description: "Bundle prompt+files for expert LLM consults."
---

Use the Oracle CLI to package a prompt plus file context for another model (API or browser).

## When to use
- You are stuck on a bug or design decision and need a second opinion.
- You want an external model to review code with real file context.
- You need a quick bundle to paste into ChatGPT manually.

## Inputs it expects
- Prompt to answer.
- File globs or paths to include (and exclusions with `!pattern`).
- Engine choice: `api` or `browser`.
- Model choice or multi-model list.

## Step-by-step method
1) Ensure Oracle is installed: `npm install -g @steipete/oracle`.
   - If not installed, use `npx -y @steipete/oracle` (do not use `pnpx`).
2) Run `oracle --help` once per session to confirm flags.
3) Build the prompt with `-p/--prompt` and attach files with `-f/--file`.
4) Choose engine:
   - API mode: requires `OPENAI_API_KEY` (and optional `GEMINI_API_KEY`, `ANTHROPIC_API_KEY`).
   - Browser mode: uses logged-in Chrome and can be paired with `--render` + `--copy` for manual paste.
5) Review the output, summarize, and apply the guidance.

## Common commands
- Render and copy bundle for manual paste:
  `oracle --render --copy -p "Review the data layer" --file "src/**/*.ts"`
- API run (auto engine selection when `OPENAI_API_KEY` is set):
  `oracle -p "Find the bug" --file "src/**/*.ts"`
- Multi-model API run:
  `oracle -p "Cross-check assumptions" --models gpt-5.2-pro,gemini-3-pro --file "src/**/*.ts"`
- Browser run:
  `oracle --engine browser -p "Walk the UI" --file "src/**/*.ts"`

## Output format requirements
- Use concise, explicit prompts.
- Prefer `--render --copy` when automation is blocked.
- Attach only relevant files to keep context focused.

## Smoke test
- Run `oracle --render --copy -p "Summarize README" --file README.md` and confirm a bundle is printed.
