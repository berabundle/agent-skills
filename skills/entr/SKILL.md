---
name: entr
description: "Use for running commands automatically when files change (file watcher)."
---

Run arbitrary commands when files change.

## When to use
- Auto-running tests on file save
- Rebuilding projects on source changes
- Live-reloading development servers
- Any watch-and-execute workflow

## Inputs it expects
- List of files to watch (via stdin)
- Command to execute when changes detected
- Optional: flags for restart behavior, screen clearing

## Step-by-step method

### Basic usage
```bash
# Watch specific files
ls *.py | entr python main.py

# Watch recursively with find
find . -name '*.ts' | entr npm test

# Use fd for faster finding
fd -e py | entr pytest
```

### Common flags
- `-c` - Clear screen before running (use twice `-cc` to clear scrollback)
- `-r` - Restart persistent process (kills and restarts on change)
- `-p` - Postpone first run until a file changes
- `-s` - Use shell to evaluate command
- `-d` - Exit when new files are added to watched directories

### The `/_` placeholder
```bash
# /_ is replaced with the changed file path
ls *.py | entr python /_

# Run linter on changed file only
fd -e ts | entr eslint /_
```

### Common patterns
```bash
# Auto-run tests
fd -e py | entr -c pytest

# Restart server on changes
fd -e js | entr -r node server.js

# Rebuild on source changes
fd -e c -e h | entr -c make

# TypeScript watch (restart tsc)
fd -e ts | entr -r npx tsc --watch

# Run specific test file that changed
fd -e test.ts | entr -c npx jest /_
```

### With shell commands
```bash
# Use -s for shell features
ls *.md | entr -s 'pandoc README.md -o README.html && echo "Done"'
```

## Output format requirements
- Executes command and shows its output
- Waits for command to finish before watching again (unless `-r`)
- Exit codes: 0 normal, 1 on error

## Related skills
- `fd` - fast file lists
- `rg` - targeted watch sets
- `web-iterate` - auto-capture UI

## Smoke test
```bash
echo /tmp | entr -p echo "File changed"
# Should wait for /tmp to change, then echo
# (Ctrl-C to exit)
```
