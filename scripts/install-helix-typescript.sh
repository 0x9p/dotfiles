#!/bin/bash

# Script to install TypeScript language support for Helix editor
# Installs: typescript-language-server, typescript, and prettier

set -e

echo "🔧 Installing TypeScript language support for Helix..."
echo ""

# Check if npm is installed
if ! command -v npm &> /dev/null; then
    echo "❌ Error: npm is not installed."
    echo "   Please install Node.js and npm first."
    exit 1
fi

# Install typescript-language-server
echo "📦 Installing typescript-language-server..."
if command -v typescript-language-server &> /dev/null; then
    echo "   ✓ typescript-language-server is already installed"
    echo "   Updating to latest version..."
    npm install -g typescript-language-server
    echo "   ✓ typescript-language-server updated"
else
    npm install -g typescript-language-server
    echo "   ✓ typescript-language-server installed"
fi

# Install typescript
echo "📦 Installing typescript..."
if npm list -g typescript &> /dev/null; then
    echo "   ✓ typescript is already installed"
    echo "   Updating to latest version..."
    npm install -g typescript
    echo "   ✓ typescript updated"
else
    npm install -g typescript
    echo "   ✓ typescript installed"
fi

# Install prettier for formatting
echo "📦 Installing prettier..."
if command -v prettier &> /dev/null; then
    echo "   ✓ prettier is already installed"
    echo "   Updating to latest version..."
    npm install -g prettier
    echo "   ✓ prettier updated"
else
    npm install -g prettier
    echo "   ✓ prettier installed"
fi

echo ""
echo "✅ TypeScript language support installation complete!"
echo ""
echo "📝 Add this to your helix languages.toml:"
echo ""
cat << 'EOF'
[[language]]
name = "typescript"
language-servers = ["typescript-language-server"]
auto-format = true
formatter = { command = "prettier", args = ["--parser", "typescript"] }

[[language]]
name = "tsx"
language-servers = ["typescript-language-server"]
auto-format = true
formatter = { command = "prettier", args = ["--parser", "typescript"] }

[[language]]
name = "javascript"
language-servers = ["typescript-language-server"]
auto-format = true
formatter = { command = "prettier", args = ["--parser", "babel"] }

[[language]]
name = "jsx"
language-servers = ["typescript-language-server"]
auto-format = true
formatter = { command = "prettier", args = ["--parser", "babel"] }
EOF
