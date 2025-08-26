# Neovim Cheatsheet

## Leader Key
- **Leader**: `Space` (your command prefix)

## File Operations
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>pv` | Toggle file tree | Space + p + v |
| `<leader>w` | Save file | Space + w |
| `<leader>q` | Quit | Space + q |
| `<leader>Q` | Force quit all | Space + Shift + q |

## Fuzzy Finding (Telescope)
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>ff` | Find files | Space + f + f |
| `<leader>fg` | Live grep | Space + f + g (search in files) |
| `<leader>fb` | Find buffers | Space + f + b (open files) |
| `<leader>fh` | Help tags | Space + f + h (help docs) |

## Window Navigation (like tmux!)
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl+h` | Go left | Move to left window |
| `Ctrl+j` | Go down | Move to down window |
| `Ctrl+k` | Go up | Move to up window |
| `Ctrl+l` | Go right | Move to right window |

## Window Resizing
| Shortcut | Action |
|----------|--------|
| `Ctrl+↑` | Resize window up |
| `Ctrl+↓` | Resize window down |
| `Ctrl+←` | Resize window left |
| `Ctrl+→` | Resize window right |

## Text Editing
| Shortcut | Mode | Action |
|----------|------|--------|
| `J` | Visual | Move selected text down |
| `K` | Visual | Move selected text up |
| `<` | Visual | Indent left (stays selected) |
| `>` | Visual | Indent right (stays selected) |

## Smart Navigation
| Shortcut | Action | Description |
|----------|--------|-------------|
| `Ctrl+d` | Page down | Half page down + center cursor |
| `Ctrl+u` | Page up | Half page up + center cursor |
| `n` | Next search | Next search result + center |
| `N` | Previous search | Previous search result + center |
| `J` | Join lines | Join lines without moving cursor |

## Clipboard Operations
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>y` | Yank to system | Copy to system clipboard |
| `<leader>Y` | Yank line to system | Copy line to system clipboard |
| `<leader>p` | Smart paste | Paste without losing copied text |
| `<leader>d` | Delete without yank | Delete without overwriting clipboard |

## Utility
| Shortcut | Action | Description |
|----------|--------|-------------|
| `<leader>h` | Clear highlights | Clear search highlights |

## Basic Vim Motions (Reminders)
| Shortcut | Action |
|----------|--------|
| `h j k l` | Left, down, up, right |
| `w` | Next word |
| `b` | Previous word |
| `0` | Beginning of line |
| `$` | End of line |
| `gg` | Top of file |
| `G` | Bottom of file |
| `dd` | Delete line |
| `yy` | Copy line |
| `p` | Paste |
| `/text` | Search for "text" |
| `:%s/old/new/g` | Replace all "old" with "new" |

## Modes
- `i` - Insert mode (start typing)
- `v` - Visual mode (select text)
- `V` - Visual line mode (select lines)
- `Esc` - Back to normal mode
- `:` - Command mode

## File Explorer (when open with `<leader>pv`)
- `Enter` - Open file/folder
- `-` - Go up directory  
- `%` - Create new file
- `d` - Create new directory

---
*This cheatsheet will grow as we add more plugins and features!*