#!/usr/bin/env bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

link() {
  local src="$1"
  local dest="$2"
  mkdir -p "$(dirname "$dest")"

  # Already pointing to the right place — nothing to do
  if [ -L "$dest" ] && [ "$(readlink "$dest")" = "$src" ]; then
    echo "  already linked: $dest"
    return
  fi

  # Existing file or symlink pointing elsewhere — back it up
  if [ -e "$dest" ] || [ -L "$dest" ]; then
    mv "$dest" "${dest}.bak"
    echo "  backed up: ${dest}.bak"
  fi

  ln -sfn "$src" "$dest"
  echo "  linked: $dest"
}

echo "==> Checking Homebrew"
if ! command -v brew >/dev/null 2>&1; then
  echo "Homebrew not found. Install it first:"
  echo "  /bin/bash -c \"\$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)\""
  exit 1
fi

echo "==> Installing packages from Brewfile"
brew bundle --file "${DOTFILES_DIR}/Brewfile"


echo "==> Linking dotfiles"
link "${DOTFILES_DIR}/zsh/.zshrc"                 "${HOME}/.zshrc"
link "${DOTFILES_DIR}/wezterm"                    "${HOME}/.config/wezterm"
link "${DOTFILES_DIR}/tmux/tmux.conf"             "${HOME}/.tmux.conf"
link "${DOTFILES_DIR}/nvim"                       "${HOME}/.config/nvim"
link "${DOTFILES_DIR}/starship/starship.toml"     "${HOME}/.config/starship.toml"

echo "==> Installing Tmux Plugin Manager"
if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"
  echo "  installed TPM — run prefix+I inside tmux to install plugins"
else
  echo "  TPM already installed"
fi

echo "==> Done"
echo ""
echo "Next steps:"
echo "  1. Open Ghostty"
echo "  2. tmux new-session -s main"
echo "  3. Inside tmux: press \`+I to install plugins"
