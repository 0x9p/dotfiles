# 🚀 Doom Emacs Configuration

> A comprehensive development environment powered by Doom Emacs

This repository contains my personal Doom Emacs configuration optimized for Go, TypeScript, and general development workflows. It includes all necessary tools, language servers, and a curated collection of keybindings for maximum productivity.

---

## 📋 Table of Contents

- [Prerequisites](#prerequisites)
- [System Dependencies](#system-dependencies)
- [Language-Specific Setup](#language-specific-setup)
  - [Go Development](#go-development)
  - [TypeScript/JavaScript Development](#typescriptjavascript-development)
- [Keybindings Reference](#keybindings-reference)
- [Installation](#installation)

---

## Prerequisites

- [Doom Emacs](https://github.com/doomemacs/doomemacs) installed and configured
- [Homebrew](https://brew.sh/) (macOS/Linux)
- [Go](https://golang.org/) (for Go development)
- [Node.js](https://nodejs.org/) and npm (for TypeScript/JavaScript development)

---

## System Dependencies

Install essential system tools and fonts:

```bash
# Nerd Font for proper icon display
brew install --cask font-symbols-only-nerd-font

# Shell script linting
brew install shellcheck

# Markdown processing
brew install markdown
```

---

## Language-Specific Setup

### Go Development

#### Environment Configuration

Add the following to your shell profile (`~/.zshrc` or `~/.bashrc`):

```bash
export PATH="$PATH:$(go env GOPATH)/bin"
```

#### Go Tools Installation

Install essential Go development tools:

```bash
# Core Go utilities
go install github.com/x-motemen/gore/cmd/gore@latest           # REPL
go install github.com/stamblerre/gocode@latest                 # Autocompletion
go install golang.org/x/tools/cmd/godoc@latest                 # Documentation
go install golang.org/x/tools/cmd/goimports@latest             # Import management
go install golang.org/x/tools/cmd/gorename@latest              # Refactoring
go install golang.org/x/tools/cmd/guru@latest                  # Code navigation
go install github.com/cweill/gotests/...@latest                # Test generation
go install github.com/fatih/gomodifytags@latest                # Struct tag manipulation

# Language Server Protocol (LSP) support
go install golang.org/x/tools/gopls@latest

# Linting and code quality
go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
```

### TypeScript/JavaScript Development

Install TypeScript tooling:

```bash
# TypeScript compiler
npm i -g typescript

# TypeScript Language Server
npm i -g typescript-language-server
```

#### Tree-sitter Grammar Installation

After installing the language servers, set up tree-sitter grammars in Doom Emacs:

```elisp
M-x treesit-install-language-grammar RET
# Select: javascript, typescript, tsx
```

---

## Keybindings Reference

### Buffer Management

| Keybinding | Description                            |
|------------|----------------------------------------|
| `SPC b b`  | Show all open buffers                  |
| `SPC b k`  | Kill current buffer                    |
| `SPC b O`  | Kill other buffers (keep current only) |

### Code Navigation

| Keybinding | Description             |
|------------|-------------------------|
| `SPC c d`  | Go to definition        |
| `SPC c D`  | Go to references        |
| `SPC c I`  | Go to implementation    |
| `g s s`    | Jump to (avy/easymotion)|

### File Operations

| Keybinding              | Description        |
|-------------------------|--------------------|
| `SPC .`                 | Open file finder   |
| `SPC f f <name> RET`    | Create a new file  |

### Motion Commands

| Keybinding | Description          |
|------------|----------------------|
| `g g`      | Go to first line     |
| `G`        | Go to last line      |
| `0`        | Go to start of line  |
| `SHIFT $`  | Go to end of line    |

### Editing

| Keybinding | Description     |
|------------|-----------------|
| `d d`      | Delete line     |

### Code Folding

| Keybinding          | Description        |
|---------------------|--------------------|
| `TAB`               | Toggle fold        |
| `SHIFT TAB`         | Collapse all       |
| `SHIFT TAB` (2x)    | Expand all         |

### Org Mode (Task Management)

| Keybinding | Description          |
|------------|----------------------|
| `C-c C-t`  | Change TODO status   |
| `C-c ,`    | Change priority      |
| `SPC o A t`| Show all tasks       |
| `s r`      | Regex filter         |

**Happy Hacking!** 🎉
