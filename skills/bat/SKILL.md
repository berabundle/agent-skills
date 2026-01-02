---
name: bat
description: "Use for viewing files with syntax highlighting, line numbers, and git integration (better cat)."
---

A cat clone with syntax highlighting and Git integration.

## When to use
- Viewing source code files with highlighting
- Showing file contents with line numbers
- Previewing files with git diff indicators
- Concatenating files with visual formatting

## Inputs it expects
- One or more file paths, OR
- Stdin for piped content
- Optional: language override, line range, theme

## Step-by-step method

### Basic usage
```bash
# View a file
bat file.py

# View multiple files
bat src/*.ts

# Pipe content
echo '{"key": "value"}' | bat -l json
```

### Common flags
- `-n` - Show line numbers only (no other decorations)
- `-p` - Plain output (no decorations), `-pp` also disables paging
- `-l LANG` - Force language for highlighting
- `-H N` or `-H N:M` - Highlight specific lines
- `--style=STYLE` - Set decoration style (full, plain, numbers, grid)
- `-A` - Show non-printable characters
- `--diff` - Only show modified lines

### Integration with other tools
```bash
# Use as pager for man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# Preview in fzf
fzf --preview 'bat --color=always {}'

# Show git diff with syntax highlighting
git diff | bat
```

### Useful combinations
```bash
# View specific line range
bat --line-range 10:20 file.py

# Compare files side by side (with diff)
bat file1.py file2.py
```

## Output format requirements
- Outputs to stdout with ANSI colors (unless `--color=never`)
- Respects terminal width
- Uses pager for long files (configurable)

## Related skills
- `fzf` - preview file content interactively
- `rg` - search then view matches
- `git` - view diffs with syntax highlighting

## Smoke test
```bash
echo 'print("hello")' | bat -l python -p
# Should show syntax-highlighted Python
```
