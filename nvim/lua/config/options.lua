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
opt.hidden = true         -- Allow hidden buffers
opt.swapfile = false      -- Don't create swap files
opt.backup = false        -- Don't create backup files
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true       -- Save undo history to file
opt.updatetime = 50       -- Faster completion (default is 4000ms)

-- Clipboard
opt.clipboard = "unnamedplus"  -- Use system clipboard

-- Split behavior
opt.splitbelow = true     -- New horizontal splits go below
opt.splitright = true     -- New vertical splits go right