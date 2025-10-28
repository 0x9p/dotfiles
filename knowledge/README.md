# Knowledge Management Templates

This directory contains templates for the knowledge management system.

## Templates

- `daily_tasks_template.md` - Template for daily task files
- `simple_task_template.md` - Template for individual task files

## Setup

Run the setup script to configure the system:

```bash
../scripts/setup-knowledge.sh
```

This will:
1. Ask for your knowledge directory path
2. Ask for your task prefix
3. Add shell commands to your `.zshrc`

## Directory Structure

Your knowledge directory will have:
- `00_templates/` - Task templates (copied from this directory)
- `01_daily/` - Daily task files
- `02_tasks/` - Individual task files

