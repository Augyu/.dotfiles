# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for a macOS terminal environment: Ghostty, tmux, and Neovim. Each tool has its own subdirectory; `install.sh` symlinks them into place and manages dependencies via Brewfile.

## Repository Structure

```
dotfiles/
├── install.sh          # Bootstrap: brew bundle + symlinks + TPM
├── Brewfile            # Homebrew packages and casks
├── ghostty/
│   └── config          # → ~/.config/ghostty (whole dir symlinked)
├── tmux/
│   └── tmux.conf       # → ~/.tmux.conf
└── nvim/               # → ~/.config/nvim (whole dir symlinked)
    ├── init.lua
    └── lua/
        ├── config/     # options.lua, keymaps.lua, autocmds.lua
        └── plugins/    # init.lua (lazy.nvim + all plugin specs)
```

## Deployment

`install.sh` creates symlinks, so edits in this repo take effect immediately without re-running anything. To bootstrap a new machine:

```bash
git clone <repo> ~/dotfiles
cd ~/dotfiles
./install.sh
```

Homebrew must already be installed. The script will error early if it's missing.

To add/update packages: edit `Brewfile`, then `brew bundle`.
To regenerate Brewfile from current installs: `brew bundle dump --force` (produces a noisy dump — prune manually).

## Configuration Architecture

### Ghostty (`ghostty/config`)
Simple key=value config. Theme is the built-in `catppuccin-mocha`. Pane management is fully delegated to tmux — no keybinding overrides needed. `macos-titlebar-style = hidden` for a cleaner look.

### Tmux (`tmux/tmux.conf`)
Prefix is backtick (`` ` ``). Uses TPM with `tmux-resurrect` and `tmux-continuum` for session persistence (auto-save every 15 minutes). Theme is Catppuccin Mocha with hardcoded hex values. New panes/windows inherit `pane_current_path`.

### Neovim (`nvim/`)
`init.lua` loads four modules in order: `config/options`, `config/keymaps`, `config/autocmds`, then `plugins`. Plugin manager is lazy.nvim (auto-bootstrapped). All plugin specs and their configs live inline in `nvim/lua/plugins/init.lua`. Leader key is Space.

Plugins: catppuccin (transparent bg), nvim-treesitter, nvim-tree, telescope, lualine.

## Theme Consistency

All three tools use Catppuccin Mocha. Key hex values used in tmux:
- Base: `#1e1e2e`, Text: `#cdd6f4`, Accent: `#cba6f7`, Muted: `#6c7086`

When changing the scheme, update: `ghostty/config` (`theme`), hex values in `tmux/tmux.conf`, and the catppuccin flavour in `nvim/lua/plugins/init.lua`.
