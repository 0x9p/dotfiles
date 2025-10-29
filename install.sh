#!/bin/bash

set -e

echo "🚀 Installing Helix and dependencies..."

# Colors for output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    echo "❌ Homebrew is not installed. Install Homebrew: https://brew.sh/"
    exit 1
fi

# Install Helix
echo -e "${BLUE}📦 Installing Helix editor...${NC}"
brew install helix

# Install Language Servers
echo -e "${BLUE}📦 Installing language servers...${NC}"
brew install marksman

# Install Markdown preview tool
echo -e "${BLUE}📦 Installing Markdown preview tool...${NC}"
brew install glow

# Install nvm and Node.js if not present
if ! command -v npm &> /dev/null; then
    echo -e "${BLUE}📦 Installing nvm and Node.js...${NC}"
    
    # Install nvm if not installed
    if [ ! -d "$HOME/.nvm" ]; then
        echo "Installing nvm..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
        
        # Load nvm
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    else
        # Load nvm if already installed
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    fi
    
    # Install Node.js LTS
    nvm install --lts
    nvm use --lts
else
    echo -e "${BLUE}Node.js is already installed${NC}"
fi

# Install formatters and linters
echo -e "${BLUE}📦 Installing formatters and linters...${NC}"
npm install -g prettier
npm install -g markdownlint-cli

# Create Helix config directory
echo -e "${BLUE}📁 Setting up configuration files...${NC}"
HELIX_CONFIG_DIR="$HOME/.config/helix"
mkdir -p "$HELIX_CONFIG_DIR"

# Copy configuration files
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cp "$SCRIPT_DIR/helix/config.toml" "$HELIX_CONFIG_DIR/config.toml"
cp "$SCRIPT_DIR/helix/languages.toml" "$HELIX_CONFIG_DIR/languages.toml"

echo -e "${GREEN}✅ Installation complete!${NC}"
echo ""
echo "📚 Optional: Setup Friday task management system"
echo "   Run: ./scripts/setup-friday.sh"
echo ""
