-- ~/.config/nvim/lua/config/keymaps.lua
-- Key bindings and mappings

-- Set leader key to space (this is a special key for custom shortcuts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Helper function for mapping keys
local function map(mode, lhs, rhs, opts)
  opts = opts or {}
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- Normal mode mappings
-- File operations
map("n", "<leader>pv", vim.cmd.Ex, { desc = "Open file explorer" })

-- Better window navigation (like your tmux setup!)
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Go to down window" })
map("n", "<C-k>", "<C-w>k", { desc = "Go to up window" })
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Window resizing (similar to tmux)
map("n", "<C-Up>", ":resize -2<CR>", { desc = "Resize window up" })
map("n", "<C-Down>", ":resize +2<CR>", { desc = "Resize window down" })
map("n", "<C-Left>", ":vertical resize -2<CR>", { desc = "Resize window left" })
map("n", "<C-Right>", ":vertical resize +2<CR>", { desc = "Resize window right" })

-- Better indenting (stay in visual mode)
map("v", "<", "<gv", { desc = "Indent left and reselect" })
map("v", ">", ">gv", { desc = "Indent right and reselect" })

-- Move text up and down (in visual mode)
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected text down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected text up" })

-- Keep cursor in place when joining lines
map("n", "J", "mzJ`z", { desc = "Join lines without moving cursor" })

-- Better page up/down (keep cursor centered)
map("n", "<C-d>", "<C-d>zz", { desc = "Page down and center" })
map("n", "<C-u>", "<C-u>zz", { desc = "Page up and center" })

-- Keep search terms in the middle
map("n", "n", "nzzzv", { desc = "Next search result (centered)" })
map("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Paste without losing the yanked text
map("x", "<leader>p", [["_dP]], { desc = "Paste without overwriting register" })

-- Yank to system clipboard
map({"n", "v"}, "<leader>y", [["+y]], { desc = "Yank to system clipboard" })
map("n", "<leader>Y", [["+Y]], { desc = "Yank line to system clipboard" })

-- Delete without yanking
map({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Clear search highlights
map("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlights" })

-- Quick save
map("n", "<leader>w", ":w<CR>", { desc = "Save file" })

-- Quick quit
map("n", "<leader>q", ":q<CR>", { desc = "Quit" })
map("n", "<leader>Q", ":qa!<CR>", { desc = "Force quit all" })