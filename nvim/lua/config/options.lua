-- ~/.config/nvim/lua/config/options.lua
-- Neovim options and settings

local opt = vim.opt

-- Line numbers
opt.number = true          -- Show line numbers
opt.relativenumber = true  -- Show relative line numbers

-- Indentation
opt.tabstop = 2           -- Number of spaces tabs count for
opt.softtabstop = 2       -- Number of spaces tabs count for while editing
opt.shiftwidth = 2        -- Size of an indent
opt.expandtab = true      -- Use spaces instead of tabs
opt.smartindent = true    -- Insert indents automatically

-- Search
opt.ignorecase = true     -- Ignore case in search
opt.smartcase = true      -- Don't ignore case with capitals
opt.hlsearch = false      -- Don't highlight search results
opt.incsearch = true      -- Show search results as you type

-- Appearance
opt.termguicolors = true  -- True color support
opt.cursorline = true     -- Highlight current line
opt.signcolumn = "yes"    -- Always show sign column
opt.wrap = false          -- Don't wrap lines
opt.scrolloff = 8         -- Keep 8 lines above/below cursor
opt.sidescrolloff = 8     -- Keep 8 columns left/right of cursor

-- Behavior
opt.hidden = true         -- Allow switching buffers without saving first
opt.swapfile = false      -- Don't create swap files
opt.backup = false        -- Don't create backup files
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"  -- Persist undo history across sessions
opt.undofile = true       -- Enable persistent undo
opt.updatetime = 50       -- Reduce delay for CursorHold events (default 4000ms is too slow)

-- Clipboard
opt.clipboard = "unnamedplus"  -- Use system clipboard

-- Split behavior
opt.splitbelow = true     -- New horizontal splits go below
opt.splitright = true     -- New vertical splits go right