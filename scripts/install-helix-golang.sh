#!/bin/bash

# Script to install Go language support for Helix editor
# Installs: gopls, golangci-lint, golangci-lint-langserver, delve

set -e

echo "🔧 Installing Go language support for Helix..."
echo ""

# Check if Go is installed
if ! command -v go &> /dev/null; then
    echo "❌ Error: Go is not installed."
    echo "   Please install Go first from https://golang.org/dl/"
    echo "   Or use: brew install go"
    exit 1
fi

GO_VERSION=$(go version | awk '{print $3}')
echo "✓ Go is installed: $GO_VERSION"
echo ""

# Install gopls (Go language server)
echo "📦 Installing gopls..."
if command -v gopls &> /dev/null; then
    GOPLS_VERSION=$(gopls version | head -n 1)
    echo "   ✓ gopls is already installed: $GOPLS_VERSION"
    echo "   Updating to latest version..."
    go install golang.org/x/tools/gopls@latest
    echo "   ✓ gopls updated"
else
    go install golang.org/x/tools/gopls@latest
    echo "   ✓ gopls installed"
fi

# Install delve (Go debugger)
echo "📦 Installing delve (optional debugger)..."
if command -v dlv &> /dev/null; then
    echo "   ✓ delve is already installed"
    echo "   Updating to latest version..."
    go install github.com/go-delve/delve/cmd/dlv@latest
    echo "   ✓ delve updated"
else
    go install github.com/go-delve/delve/cmd/dlv@latest
    echo "   ✓ delve installed"
fi

# Install golangci-lint (linter for Go)
echo "📦 Installing golangci-lint..."
if command -v golangci-lint &> /dev/null; then
    GOLANGCI_VERSION=$(golangci-lint version 2>&1 | head -n 1)
    echo "   ✓ golangci-lint is already installed: $GOLANGCI_VERSION"
    echo "   Updating to latest version..."
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
    echo "   ✓ golangci-lint updated"
else
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
    echo "   ✓ golangci-lint installed"
fi

# Install golangci-lint-langserver (LSP wrapper for golangci-lint)
echo "📦 Installing golangci-lint-langserver..."
if command -v golangci-lint-langserver &> /dev/null; then
    echo "   ✓ golangci-lint-langserver is already installed"
    echo "   Updating to latest version..."
    go install github.com/nametake/golangci-lint-langserver@latest
    echo "   ✓ golangci-lint-langserver updated"
else
    go install github.com/nametake/golangci-lint-langserver@latest
    echo "   ✓ golangci-lint-langserver installed"
fi

# Check GOPATH/bin in PATH
GOPATH=${GOPATH:-$(go env GOPATH)}
if [[ ":$PATH:" != *":$GOPATH/bin:"* ]]; then
    echo ""
    echo "⚠️  Warning: $GOPATH/bin is not in your PATH"
    echo "   Add this to your shell config (~/.zshrc or ~/.bashrc):"
    echo "   export PATH=\"\$PATH:\$GOPATH/bin\""
fi

echo ""
echo "✅ Go language support installation complete!"
echo ""
echo "📝 1. Add this to your helix languages.toml:"
echo ""
cat << 'EOF'
[[language]]
name = "go"
language-servers = ["gopls", "golangci-lint-lsp"]
auto-format = true

[language-server.gopls]
command = "gopls"

[language-server.gopls.config]
staticcheck = true

[language-server.gopls.config.hints]
assignVariableTypes = true
compositeLiteralFields = true
compositeLiteralTypes = true
constantValues = true
functionTypeParameters = true
parameterNames = true
rangeVariableTypes = true

[language-server.golangci-lint-lsp]
command = "golangci-lint-langserver"

[language-server.golangci-lint-lsp.config]
command = ["golangci-lint", "run", "--out-format", "json"]

EOF
echo ""
echo "📝 2. Add this to your helix config.toml:"
echo ""
cat << 'EOF'
[editor]
auto-format = true

[editor.lsp]
display-messages = true
display-inlay-hints = true
EOF
echo ""
echo "📝 3. Optional: Create .golangci.yml in your project root (production config):"
echo ""
cat << 'EOF'
run:
  timeout: 5m
  issues-exit-code: 1
  tests: true

linters:
  enable:
    # Default linters
    - errcheck      # Check for unchecked errors
    - gosimple      # Simplify code
    - govet         # Official Go tool
    - ineffassign   # Detect ineffectual assignments
    - staticcheck   # Go vet on steroids
    - unused        # Find unused code
    
    # Additional quality linters
    - gocritic      # Comprehensive diagnostics
    - gocyclo       # Cyclomatic complexity
    - gofmt         # Format checker
    - revive        # Fast, configurable linter
    - stylecheck    # Replacement for golint
    
    # Security linters
    - gosec         # Security problems
    
    # Performance linters
    - prealloc      # Find slice declarations that could be preallocated
    
    # Error handling
    - errorlint     # Error wrapping errors
    - wrapcheck     # Check error wrapping
    
    # Code quality
    - dupl          # Code cloning detection
    - misspell      # Spelling mistakes
    - unconvert     # Unnecessary type conversions
    - unparam       # Unused function parameters
    - whitespace    # Trailing whitespace
    - bodyclose     # HTTP response body is closed
    - noctx         # HTTP requests without context
    - exportloopref # Pointers to enclosing loop variables

linters-settings:
  errcheck:
    check-type-assertions: true
    check-blank: true
  
  govet:
    check-shadowing: true
    enable-all: true
  
  staticcheck:
    checks: ["all"]
  
  gocritic:
    enabled-tags:
      - diagnostic
      - experimental
      - opinionated
      - performance
      - style
  
  gocyclo:
    min-complexity: 15
  
  dupl:
    threshold: 100
  
  gosec:
    excludes:
      - G104  # Duplicates errcheck
    severity: medium
    confidence: medium

issues:
  exclude-use-default: false
  max-issues-per-linter: 0
  max-same-issues: 0
  
  exclude-rules:
    # Exclude some linters from running on tests files
    - path: _test\.go
      linters:
        - gocyclo
        - errcheck
        - dupl
        - gosec
EOF
