#!/bin/bash

# Terminal Setup Script
# Sets up WezTerm + Tmux configuration with session restore

set -e

echo "🚀 Setting up terminal environment..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${GREEN}✓${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}⚠${NC} $1"
}

print_error() {
    echo -e "${RED}✗${NC} $1"
}

# Check if we're on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This script is designed for macOS. You may need to modify it for other systems."
    exit 1
fi

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    print_warning "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_status "Homebrew installed"
else
    print_status "Homebrew already installed"
fi

# Install WezTerm if not present
if ! command -v wezterm &> /dev/null; then
    print_warning "WezTerm not found. Installing..."
    brew install --cask wezterm
    print_status "WezTerm installed"
else
    print_status "WezTerm already installed"
fi

# Install tmux if not present
if ! command -v tmux &> /dev/null; then
    print_warning "Tmux not found. Installing..."
    brew install tmux
    print_status "Tmux installed"
else
    print_status "Tmux already installed"
fi

# Install JetBrainsMono Nerd Font
print_warning "Installing JetBrainsMono Nerd Font..."
brew install font-jetbrains-mono-nerd-font
print_status "JetBrainsMono Nerd Font installed"

# Create WezTerm config directory
mkdir -p ~/.config/wezterm
print_status "WezTerm config directory created"

# Backup and copy WezTerm configuration
if [ -f ~/.config/wezterm/wezterm.lua ]; then
    cp ~/.config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua.backup
    print_warning "Backed up existing wezterm.lua to wezterm.lua.backup"
fi
if [ -f ~/.config/wezterm/CLAUDE.md ]; then
    cp ~/.config/wezterm/CLAUDE.md ~/.config/wezterm/CLAUDE.md.backup
    print_warning "Backed up existing CLAUDE.md to CLAUDE.md.backup"
fi

cp wezterm.lua ~/.config/wezterm/
cp CLAUDE.md ~/.config/wezterm/
print_status "WezTerm configuration copied"

# Backup and copy tmux configuration
if [ -f ~/.tmux.conf ]; then
    cp ~/.tmux.conf ~/.tmux.conf.backup
    print_warning "Backed up existing .tmux.conf to .tmux.conf.backup"
fi

cp tmux.conf ~/.tmux.conf
print_status "Tmux configuration copied"

# Install Tmux Plugin Manager (TPM)
if [ ! -d ~/.tmux/plugins/tpm ]; then
    print_warning "Installing Tmux Plugin Manager..."
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
    print_status "TPM installed"
else
    print_status "TPM already installed"
fi

echo ""
echo "🎉 Setup complete!"
echo ""
echo "Next steps:"
echo "1. Restart WezTerm to apply new configuration"
echo "2. Start tmux: ${YELLOW}tmux new-session -s main${NC}"
echo "3. Install tmux plugins: Press ${YELLOW}Ctrl+z I${NC} (capital I)"
echo ""
echo "Your terminal setup is now ready with:"
echo "• JetBrainsMono Nerd Font Bold, 18pt"
echo "• Catppuccin Mocha theme"
echo "• Custom tab management"
echo "• Tmux with session restore"
echo "• All your custom keybindings"
echo ""
print_status "Enjoy your consistent development environment!"