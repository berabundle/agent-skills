---
name: tree
description: "Use for displaying directory structure as an indented tree diagram."
---

Display directory contents in a tree-like format.

## When to use
- Visualizing project structure
- Documenting directory layouts
- Exploring nested directories
- Generating directory listings for reports

## Inputs it expects
- Directory path(s) to display (defaults to current directory)
- Optional: depth limit, filters, output format

## Step-by-step method

### Basic usage
```bash
# Current directory
tree

# Specific directory
tree /path/to/dir

# Limit depth
tree -L 2
```

### Common flags
- `-L N` - Limit depth to N levels
- `-a` - Show hidden files
- `-d` - Directories only
- `-f` - Print full path prefix
- `-I PATTERN` - Exclude files matching pattern
- `-P PATTERN` - Only show files matching pattern
- `--gitignore` - Respect .gitignore
- `-h` - Human-readable sizes
- `-s` - Show file sizes
- `-D` - Show last modification date
- `--dirsfirst` - List directories before files

### Filtering and patterns
```bash
# Exclude node_modules and .git
tree -I 'node_modules|.git'

# Only show TypeScript files
tree -P '*.ts'

# Respect gitignore
tree --gitignore
```

### Output formats
```bash
# JSON output
tree -J

# XML output
tree -X

# HTML output
tree -H .
```

### Useful combinations
```bash
# Project overview (2 levels, ignore common dirs)
tree -L 2 -I 'node_modules|.git|dist|build' --dirsfirst

# Show structure with sizes
tree -sh --du

# Directories only, 3 levels
tree -d -L 3
```

## Output format requirements
- ASCII/Unicode tree characters for structure
- Supports JSON (`-J`), XML (`-X`), HTML (`-H`) output
- Summary line shows directory and file counts

## Related skills
- `eza` - rich listings
- `fd` - find nodes

## Smoke test
```bash
tree --version
# Should output: tree v2.x.x
```
