# Dotfiles

Personal configuration files for development tools and applications.

## Applications

- Helix Editor
- Friday Task Management System

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

**In Terminal:**
```bash
# Check for issues
markdownlint document.md

# Auto-fix issues
markdownlint --fix document.md
```

### Preview

**In Terminal:**
```bash
# Basic preview
glow -t document.md
```

---

## Friday Task Management

### Setup

Run the setup script to configure a new Friday base:

```bash
./scripts/setup-friday.sh
```

You'll be prompted for:
- Path to your Friday directory (e.g., `~/Documents/friday`, `~/work-friday`, `~/personal-friday`)
- Task prefix for this Friday base (e.g., `PROJ`, `TASK`, `WORK`)

The script will:
1. Create directory structure if needed (`00_templates`, `01_daily`, `02_tasks`)
2. Copy templates to the Friday directory
3. Create `.friday` config file in the Friday base root
4. Add shell functions to `~/.zshrc` (only once)

### Multiple Friday Bases

You can have multiple Friday bases on the same system! Each Friday base:
- Has its own directory
- Has its own task prefix
- Contains a `.friday` config file in its root
- Works independently from other Friday bases

**Example setup:**
```bash
# Work Friday base
./scripts/setup-friday.sh
# Path: ~/work-friday
# Prefix: WORK

# Personal Friday base  
./scripts/setup-friday.sh
# Path: ~/personal-friday
# Prefix: PERS
```

Friday commands automatically detect which Friday base you're in by looking for the `.friday` config file in parent directories (similar to how git works).

### Commands

> **Tip:** All commands have short aliases for faster access (see bottom of this section)

**Show help:**
```bash
friday-help  # or: fh
```
Displays all available commands and their descriptions.

**Create daily task file:**
```bash
friday-new-daily  # or: fnd
```
Creates/opens a file in `01_daily/` named with today's date (e.g., `2025_10_28.md`).

**Create new task:**
```bash
friday-new-task "Implement authentication feature"  # or: fnt "Implement authentication feature"
```
- Creates a new task file in `02_tasks/`
- Auto-increments task number (e.g., `TASK1`, `TASK2`, `TASK3`)
- Converts name to lowercase and removes special characters
- Adds task link to today's daily file
- Opens the task in Helix

**Preview today's tasks:**
```bash
friday-list-daily  # or: fld
```

**List all tasks:**
```bash
friday-list-tasks  # or: flt
```

**Set task status:**
```bash
friday-set-status 1 in_progress # or: fss 1 in_progress
friday-set-status 2 done        # or: fss 2 done
friday-set-status 3 in_review   # or: fss 3 in_review
```
Available statuses: `todo`, `progress`, `in_progress`, `review`, `in_review`, `testing`, `in_testing`, `blocked`, `done`

**Set task priority:**
```bash
friday-set-priority 1 high      # or: fsp 1 high
friday-set-priority 2 low       # or: fsp 2 low
```
Available priorities: `high`, `medium`, `low`

**Set parent task:**
```bash
friday-set-parent 5 2           # or: fspt 5 2  (Set TASK2 as parent of TASK5)
friday-set-parent 5 3           # or: fspt 5 3  (Change parent to TASK3, replaces previous)
friday-set-parent 5 none        # or: fspt 5 none  (Remove parent)
```
Creates task hierarchy - useful for breaking down large tasks into subtasks.  
**Note:** Each task can have only ONE parent task. Setting a new parent replaces the existing one.

### Short Aliases

All commands have convenient short aliases:

| Alias | Command | Description |
|-------|---------|-------------|
| `fnd` | `friday-new-daily` | Create/open daily file |
| `fnt` | `friday-new-task` | Create new task |
| `fld` | `friday-list-daily` | List today's tasks |
| `flt` | `friday-list-tasks` | List all tasks |
| `fss` | `friday-set-status` | Set task status |
| `fsp` | `friday-set-priority` | Set task priority |
| `fspt` | `friday-set-parent` | Set parent task |
| `fh` | `friday-help` | Show help |

### File Structure

```
friday/
├── .friday                  # Configuration file (auto-generated)
├── 00_templates/
│   ├── daily_tasks_template.md
│   └── simple_task_template.md
├── 01_daily/
│   ├── 2025_10_28.md
│   └── 2025_10_29.md
└── 02_tasks/
    ├── TASK1_implement_authentication.md
    ├── TASK2_write_documentation.md
    └── TASK3_test_new_release.md
```

### How It Works

1. Navigate to any directory within your Friday base
2. Run any `friday-*` command (e.g., `fnd`, `fnt`)
3. Friday searches upward for `.friday` config file
4. Loads configuration (task prefix) from the file
5. Uses the directory containing `.friday` as the Friday base root

This allows you to work from any subdirectory within your Friday base!
