---
name: ts-debug
description: "Use when you need to diagnose and fix TypeScript build/compile errors, lint failures, or test failures in a JS/TS repo using the project’s standard tooling (tsc, eslint, test runner)."
---

Diagnose and fix TypeScript errors with a repeatable check → fix → re-check loop.

## When to use
- Build/compile errors from `tsc` or bundlers.
- ESLint failures in TS projects.
- Type errors introduced by recent changes.
- CI failures tied to TS checks.

## Inputs it expects
- Repo root and current error output (if available).
- Preferred package manager (or permission to detect via lockfiles).
- Any constraints on scope or time.

## Step-by-step method
1) Read `AGENTS.md` and repo docs; honor local rules and tooling.
2) Identify package manager and scripts in `package.json`.
3) Run the smallest meaningful check to reproduce (prefer `npm|yarn|pnpm|bun run typecheck` or `tsc --noEmit`).
4) Fix the root cause, keeping diffs tight.
5) Re-run the smallest meaningful check after each fix.
6) If lint/test errors remain, follow the same loop for those failures.

## Command templates
Detect package manager:
```bash
ls package-lock.json yarn.lock pnpm-lock.yaml bun.lockb 2>/dev/null
```

Common scripts (prefer these when present):
```bash
npm run typecheck
npm run lint
npm run test
```

Direct TypeScript check (fallback):
```bash
npx tsc --noEmit
```

## Output format requirements
- Quote the primary error message(s) and file locations.
- Describe the fix and why it resolves the error.
- List checks run and their results.

## Smoke test
- Run `npx tsc --noEmit` in a TS repo and confirm errors are surfaced.

## References
- See `references/ts-debug-workflow.md` for detailed triage patterns.
