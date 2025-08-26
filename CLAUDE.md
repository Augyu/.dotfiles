# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a WezTerm terminal emulator configuration repository. The entire configuration consists of a single Lua file (`wezterm.lua`) that defines the terminal's appearance and behavior.

## Architecture

- **Single Configuration File**: `wezterm.lua` - Contains all WezTerm configuration
- **Configuration Structure**: Uses WezTerm's config builder pattern for better error handling
- **Theming**: Configured with Darcula color scheme and custom window frame styling
- **Tab Bar Customization**: Custom colors and font settings for the tab bar

## Configuration Management

This is a personal WezTerm configuration with no build process or dependencies. Changes are applied by:
1. Editing `wezterm.lua` directly
2. Reloading WezTerm (automatic detection of config changes)

## Key Configuration Areas

- **Color Scheme**: Currently set to 'Darcula (base16)'
- **Window Frame**: Custom font (Roboto Bold) and background colors
- **Tab Bar**: Custom inactive tab edge color and styling
- **Font Settings**: Tab bar font size set to 12.0

## Development Notes

- Configuration uses modern WezTerm API with `config_builder()` for better error messages
- All settings are contained in a single config table returned to WezTerm
- No external dependencies or build tools required

## Custom Keybindings

### Pane Management (WezTerm - now handled by tmux)
- ~~`Cmd+;` - Split pane horizontally~~
- ~~`Cmd+'` - Split pane vertically~~  
- ~~`Cmd+hjkl` - Navigate between panes (vim-style)~~
- ~~`Cmd+Alt+W` - Close current pane (with confirmation)~~
- ~~`Cmd+Shift+Arrow Keys` - Resize panes (5 units per press)~~

## Tmux Configuration

### Tmux Keybindings (Prefix: Ctrl+z)

**Pane Management:**
- `Ctrl+z ;` - Split pane horizontally
- `Ctrl+z '` - Split pane vertically
- `Ctrl+z hjkl` - Navigate between panes (vim-style)
- `Ctrl+z x` - Close current pane (with confirmation)
- `exit` or `Ctrl+d` - Close pane by exiting shell

**Pane Resizing:**
- `Ctrl+z H` - Resize left (can repeat H after initial prefix)
- `Ctrl+z L` - Resize right (can repeat L after initial prefix)
- `Ctrl+z J` - Resize down (can repeat J after initial prefix)
- `Ctrl+z K` - Resize up (can repeat K after initial prefix)
- `Ctrl+z z` - Toggle zoom/unzoom current pane

**Window Management:**
- `Ctrl+z c` - Create new window
- `Ctrl+z &` - Kill current window

**Session Management:**
- `Ctrl+z d` - Detach from session
- `tmux new-session -s name` - Create new named session
- `tmux attach -t name` - Attach to existing session
- `tmux list-sessions` - List all sessions

**Session Restore (automatic with plugins):**
- `Ctrl+z Ctrl+s` - Save session manually
- `Ctrl+z Ctrl+r` - Restore session manually
- `Ctrl+z I` - Install tmux plugins (run once after config changes)

### Tmux Features
- **Auto-save**: Sessions saved every 15 minutes automatically
- **Auto-restore**: Sessions restore when tmux starts
- **Pane contents**: Terminal history is preserved
- **Custom theme**: Catppuccin Mocha colors matching WezTerm
- **Mouse support**: Click to select panes, drag borders to resize

## Current Configuration Features

- **Font**: JetBrainsMono Nerd Font Bold, 18pt (terminal) / 14pt (tabs)
- **Theme**: Catppuccin Mocha
- **Tabs**: Hide when single tab, show index + process + path
- **Window**: 20px padding on all sides
- **Pane splitting**: tmux-style keybindings