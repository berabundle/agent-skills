# TypeScript debug workflow

Keep diffs tight and iterate with targeted checks.

## Triage order
1) Reproduce with the smallest meaningful check (typecheck or the failing test).
2) Fix the most local cause before touching global config.
3) Re-run the same check after each fix.

## Script selection
- Prefer `package.json` scripts when they exist.
- If no scripts, use `npx tsc --noEmit` and `npx eslint .`.
- For monorepos, detect workspace tooling (e.g., `pnpm -r`, `turbo`, `nx`).

## Common patterns
- Missing exports: fix barrel files or update import paths.
- `noImplicitAny`: add explicit types or narrow with guards.
- `strictNullChecks`: add null guards or adjust types.
- `esModuleInterop` issues: align default imports with config.
- Path aliases: verify `tsconfig.json` `paths` and build tooling.

## Safe defaults
- Do not relax TS config to hide errors unless explicitly requested.
- Prefer targeted typing fixes over broad `any`.
- Avoid changing lint rules just to silence errors.
