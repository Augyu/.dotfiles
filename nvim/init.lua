-- ~/.config/nvim/init.lua
-- Main Neovim configuration entry point

-- Load core configuration
require("config.options")  -- Vim settings/options
require("config.keymaps")  -- Key bindings
require("config.autocmds") -- Auto commands

-- Load plugin manager and plugins
require("plugins")