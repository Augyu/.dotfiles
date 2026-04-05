# Terminal Dotfiles

A portable terminal configuration featuring Ghostty + Tmux + Neovim with session restore, custom theming, and vim-style keybindings.

## Features

- **Ghostty**: Modern terminal with JetBrainsMono Nerd Font and Catppuccin Mocha theme
- **Tmux**: Session management with automatic save/restore (every 15 minutes)
- **Neovim**: Full editor setup with LSP-ready plugins, Telescope, and nvim-tree
- **Consistent Theme**: Catppuccin Mocha colors across all three tools
- **Vim-style Navigation**: hjkl pane navigation and intuitive keybindings
- **Session Persistence**: Automatically restore your terminal layout after restarts

## Quick Setup

1. **Clone this repository:**
   ```bash
   git clone <your-repo-url> ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Run the setup script:**
   ```bash
   ./install.sh
   ```

3. **Start using:**
   - Open Ghostty
   - Create a tmux session: `tmux new-session -s main`
   - Install tmux plugins: `` ` ``+`I` inside tmux

## Manual Installation

1. Install dependencies:
   ```bash
   brew install --cask ghostty
   brew install tmux neovim starship
   brew install --cask font-jetbrains-mono-nerd-font
   ```

2. Symlink configs:
   ```bash
   ln -sfn ~/.dotfiles/zsh/.zshrc ~/.zshrc
   ln -sfn ~/.dotfiles/ghostty ~/.config/ghostty
   ln -sfn ~/.dotfiles/tmux/tmux.conf ~/.tmux.conf
   ln -sfn ~/.dotfiles/nvim ~/.config/nvim
   ln -sfn ~/.dotfiles/starship/starship.toml ~/.config/starship.toml
   ```

3. Install Tmux Plugin Manager:
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

## Configuration Details

### Ghostty
- **Font**: JetBrainsMono Nerd Font Bold, 18pt
- **Theme**: Catppuccin Mocha (built-in)
- **Padding**: 20px on all sides
- **Pane management**: fully delegated to tmux

### Tmux (Prefix: `` ` ``)
- **Auto-save**: Sessions saved every 15 minutes via tmux-continuum
- **Auto-restore**: Sessions restore when tmux starts via tmux-resurrect
- **Custom theme**: Catppuccin Mocha colors
- **Mouse support**: Click to select panes, drag borders to resize

### Neovim
- **Plugin manager**: lazy.nvim (auto-bootstrapped)
- **Plugins**: catppuccin, nvim-treesitter, nvim-tree, telescope, lualine
- **Leader key**: Space

## Key Bindings

### Tmux (Prefix: `` ` ``)

**Pane Management:**
- `` ` ; `` - Split pane horizontally
- `` ` ' `` - Split pane vertically
- `` ` hjkl `` - Navigate between panes (vim-style)
- `` ` z `` - Zoom/unzoom current pane

**Pane Resizing (repeatable):**
- `` ` H/L/J/K `` - Resize left/right/down/up

**Session Management:**
- `` ` d `` - Detach from session
- `` ` c `` - New window (in current directory)
- `tmux attach -t <session>` - Attach to session

**Session Restore:**
- `` ` Ctrl+s `` - Save session manually
- `` ` Ctrl+r `` - Restore session manually

### Neovim (Leader: Space)

- `<leader>pv` - Toggle file explorer (nvim-tree)
- `<leader>ff/fg/fb/fh` - Telescope: files / grep / buffers / help
- `<leader>y/Y` - Yank to system clipboard
- `<leader>w/q` - Save / quit

## File Structure

```
~/.dotfiles/
├── README.md
├── CLAUDE.md
├── install.sh              # Bootstrap: brew bundle + symlinks + TPM
├── Brewfile
├── ghostty/
│   └── config
├── tmux/
│   └── tmux.conf
├── zsh/
│   └── .zshrc
├── starship/
│   └── starship.toml
└── nvim/
    ├── init.lua
    └── lua/
        ├── config/
        │   ├── options.lua
        │   ├── keymaps.lua
        │   └── autocmds.lua
        └── plugins/
            └── init.lua
```

## Updating

```bash
cd ~/.dotfiles
git pull
# install.sh is idempotent — re-run if new symlinks were added
./install.sh
```

## Troubleshooting

**Tmux plugins not working?**
- Run `` ` ``+`I` to install plugins
- Restart tmux: `tmux kill-server && tmux`

**Font not appearing?**
- Ensure JetBrainsMono Nerd Font is installed: `brew install --cask font-jetbrains-mono-nerd-font`
- Restart Ghostty

**Session restore not working?**
- Check tmux plugins are installed
- Verify `~/.tmux/resurrect/` directory exists

## License

Personal dotfiles configuration. Feel free to use and modify.
