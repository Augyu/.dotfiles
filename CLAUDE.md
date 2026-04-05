# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

Personal dotfiles for a macOS terminal environment: WezTerm, tmux, and Neovim. Each tool has its own subdirectory; `install.sh` symlinks them into place and manages dependencies via Brewfile.

## Repository Structure

```
dotfiles/
├── install.sh          # Bootstrap: brew bundle + symlinks + TPM
├── Brewfile            # Homebrew packages and casks
├── wezterm/
│   └── wezterm.lua     # → ~/.config/wezterm (whole dir symlinked)
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

### WezTerm (`wezterm/wezterm.lua`)
Lua config using `config_builder()`. Theme is Catppuccin Mocha. Pane management delegated to tmux — keys table only contains Cmd+1-9 for tmux window switching (sends `\x1b1`-`\x1b9`). Tab bar styled to match Catppuccin colors.

### Tmux (`tmux/tmux.conf`)
Prefix is `Ctrl+a`. Uses TPM with `tmux-resurrect` and `tmux-continuum` for session persistence (auto-save every 15 minutes). Theme is Catppuccin Mocha with hardcoded hex values. Status bar is at the top. New panes/windows inherit `pane_current_path`. Windows auto-rename to show current directory (idle) or `path: process` (when a command is running). Split panes with `Ctrl+a =` (horizontal) and `Ctrl+a -` (vertical).

### Neovim (`nvim/`)
`init.lua` loads four modules in order: `config/options`, `config/keymaps`, `config/autocmds`, then `plugins`. Plugin manager is lazy.nvim (auto-bootstrapped). All plugin specs and their configs live inline in `nvim/lua/plugins/init.lua`. Leader key is Space.

Plugins: catppuccin (transparent bg), nvim-treesitter, nvim-tree, telescope, lualine.

## Theme Consistency

All three tools use Catppuccin Mocha. Key hex values used in tmux:
- Base: `#1e1e2e`, Text: `#cdd6f4`, Accent: `#cba6f7`, Muted: `#6c7086`

When changing the scheme, update: `wezterm/wezterm.lua` (`color_scheme`), hex values in `tmux/tmux.conf`, and the catppuccin flavour in `nvim/lua/plugins/init.lua`.
