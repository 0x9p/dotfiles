# Dotfiles

Personal configuration files for development tools and applications.

## Applications

### Helix Editor

## Quick Install

```bash
chmod +x install.sh
./install.sh
```

The script will automatically:
1. Install configured applications
2. Install all necessary dependencies
3. Copy configuration files to appropriate locations

## Working with Markdown

### Formatting

**In Helix:**
```
:format
```
Auto-formats the current file with Prettier (also runs automatically on save).

**In Terminal:**
```bash
prettier --write document.md
```

### Validation

**In Helix:**
```
:sh markdownlint %
```

**In Terminal:**
```bash
# Check for issues
markdownlint document.md

# Auto-fix issues
markdownlint --fix document.md
```

### Preview

**In Helix:**
```
:sh glow %
```

**In Terminal:**
```bash
# Basic preview
glow document.md

# With pager
glow -p document.md
```

> **Tip:** In Helix, `%` represents the current file path, so `:sh glow %` runs `glow` on the file you're editing.

---
