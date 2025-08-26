# Terminal Dotfiles

A portable terminal configuration featuring WezTerm + Tmux with session restore, custom theming, and vim-style keybindings.

## Features

- **WezTerm**: Modern terminal with custom font and Catppuccin Mocha theme
- **Tmux**: Session management with automatic save/restore
- **Custom Theme**: Consistent Catppuccin Mocha colors across both tools
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
   ./setup.sh
   ```

3. **Start using:**
   - Restart WezTerm
   - Create tmux session: `tmux new-session -s main`
   - Install tmux plugins: `Ctrl+z I`

## Manual Installation

If you prefer to install manually:

1. Install dependencies:
   ```bash
   brew install --cask wezterm
   brew install tmux
   brew install font-jetbrains-mono-nerd-font
   ```

2. Copy configurations:
   ```bash
   mkdir -p ~/.config/wezterm
   cp wezterm.lua ~/.config/wezterm/
   cp CLAUDE.md ~/.config/wezterm/
   cp tmux.conf ~/.tmux.conf
   ```

3. Install Tmux Plugin Manager:
   ```bash
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   ```

## Configuration Details

### WezTerm Features
- **Font**: JetBrainsMono Nerd Font Bold, 18pt (terminal) / 14pt (tabs)
- **Theme**: Catppuccin Mocha
- **Tabs**: Auto-hide when single tab, show index + process + path
- **Window**: 20px padding on all sides

### Tmux Features (Prefix: Ctrl+z)
- **Auto-save**: Sessions saved every 15 minutes
- **Auto-restore**: Sessions restore when tmux starts
- **Custom theme**: Catppuccin Mocha colors
- **Mouse support**: Click to select panes, drag borders to resize

## Key Bindings

### Tmux (Prefix: Ctrl+z)

**Pane Management:**
- `Ctrl+z ;` - Split pane horizontally
- `Ctrl+z '` - Split pane vertically
- `Ctrl+z hjkl` - Navigate between panes (vim-style)
- `Ctrl+z x` - Close current pane

**Pane Resizing:**
- `Ctrl+z H` - Resize left (can repeat H after initial prefix)
- `Ctrl+z L` - Resize right (can repeat L after initial prefix)
- `Ctrl+z J` - Resize down (can repeat J after initial prefix)
- `Ctrl+z K` - Resize up (can repeat K after initial prefix)

**Session Management:**
- `Ctrl+z d` - Detach from session
- `Ctrl+z c` - Create new window
- `tmux attach -t <session>` - Attach to session

**Session Restore:**
- `Ctrl+z Ctrl+s` - Save session manually
- `Ctrl+z Ctrl+r` - Restore session manually

## File Structure

```
~/.dotfiles/
├── README.md          # This file
├── setup.sh          # Automated setup script
├── wezterm.lua       # WezTerm configuration
├── tmux.conf         # Tmux configuration
└── CLAUDE.md         # Detailed documentation
```

## Updating

To sync changes across machines:

1. **Push changes from main machine:**
   ```bash
   cd ~/.dotfiles
   git add .
   git commit -m "Update terminal config"
   git push
   ```

2. **Pull changes on other machine:**
   ```bash
   cd ~/.dotfiles
   git pull
   ./setup.sh
   ```

## Customization

- **WezTerm**: Edit `wezterm.lua`
- **Tmux**: Edit `tmux.conf`
- **Colors**: Both use Catppuccin Mocha - search and replace color codes
- **Keybindings**: Modify the respective config files

## Troubleshooting

**Tmux plugins not working?**
- Run `Ctrl+z I` to install plugins
- Restart tmux: `tmux kill-server && tmux`

**Font not appearing?**
- Ensure JetBrainsMono Nerd Font is installed: `brew install font-jetbrains-mono-nerd-font`
- Restart WezTerm

**Session restore not working?**
- Check tmux plugins are installed
- Verify `~/.tmux/resurrect/` directory exists

## License

Personal dotfiles configuration. Feel free to use and modify.