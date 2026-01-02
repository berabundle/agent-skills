---
name: fzf
description: "Use for interactive fuzzy finding of files, commands, history, or any list input."
---

Interactive fuzzy finder for filtering and selecting from lists.

## When to use
- Finding files interactively by partial name
- Searching command history
- Selecting from a list of options (branches, processes, etc.)
- Piping any list through interactive filtering

## Inputs it expects
- A list piped via stdin, OR
- Files/directories to search (defaults to current directory)
- Optional: search query, preview commands, key bindings

## Step-by-step method

### Basic file finding
```bash
# Find files interactively
fzf

# Find and open in editor
vim $(fzf)

# With preview
fzf --preview 'bat --color=always {}'
```

### Filter any list
```bash
# Git branches
git branch | fzf

# Running processes
ps aux | fzf

# Command history
history | fzf
```

### Common flags
- `-e, --exact` - Exact match instead of fuzzy
- `-i` - Case insensitive
- `-m` - Multi-select (Tab to select)
- `--preview CMD` - Show preview of selection
- `--height N%` - Use portion of screen instead of fullscreen
- `-q QUERY` - Start with initial query

### Integration patterns
```bash
# cd to selected directory
cd $(find . -type d | fzf)

# Kill selected process
kill $(ps aux | fzf | awk '{print $2}')

# Git checkout branch
git checkout $(git branch | fzf)
```

## Output format requirements
- Returns selected item(s) to stdout
- Exit code 0 on selection, 1 on cancel (Ctrl-C/Esc), 130 on interrupt

## Related skills
- `bat` - preview content
- `rg` - pipe matches into fzf
- `fd` - file lists

## Smoke test
```bash
echo -e "apple\nbanana\ncherry" | fzf --filter=an
# Should output: banana
```
