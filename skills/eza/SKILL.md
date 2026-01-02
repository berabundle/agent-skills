---
name: eza
description: "Use for listing files and directories with colors, icons, git status, and tree view (better ls)."
---

A modern replacement for ls with git integration and tree view.

## When to use
- Listing directory contents with rich formatting
- Viewing git status of files in a directory
- Displaying directory trees
- Getting detailed file metadata

## Inputs it expects
- Directory path(s) to list (defaults to current directory)
- Optional: display options, sorting, filtering

## Step-by-step method

### Basic usage
```bash
# Simple listing
eza

# Long format with details
eza -l

# Include hidden files
eza -a

# Tree view
eza -T
```

### Common flags
- `-l, --long` - Long format with metadata
- `-a, --all` - Show hidden files
- `-T, --tree` - Tree view
- `-L N, --level N` - Limit tree depth
- `--icons` - Show file type icons
- `--git` - Show git status
- `-s FIELD, --sort FIELD` - Sort by: name, size, modified, created, etc.
- `-r, --reverse` - Reverse sort order
- `-d` - List directories themselves, not contents
- `--group-directories-first` - Directories before files

### Useful combinations
```bash
# Long listing with git status and icons
eza -la --git --icons

# Tree with 2 levels, directories first
eza -T -L 2 --group-directories-first

# Sort by modification time, newest first
eza -l -s modified -r

# Only directories
eza -D

# Only files
eza -f
```

### Git integration
```bash
# Show git status column
eza -l --git
# M = modified, N = new, - = unchanged
```

## Output format requirements
- Outputs colored text to stdout
- Respects terminal width for grid layout
- Git status shown as single character indicators

## Related skills
- `tree` - directory structure overview
- `fd` - find files to list

## Smoke test
```bash
eza --version
# Should output: eza - A modern, maintained replacement for ls
```
