local wezterm = require 'wezterm'

local config = {}
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- Font
config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold' })
config.font_size = 18.0

-- Theme
config.color_scheme = 'Catppuccin Mocha'

-- Padding
config.window_padding = {
  left = 10,
  right = 10,
  top = 10,
  bottom = 10,
}

-- Window
config.window_decorations = "TITLE | RESIZE"

-- Tab bar
config.hide_tab_bar_if_only_one_tab = true
config.use_fancy_tab_bar = true

-- Title bar blends with terminal background
config.window_frame = {
  active_titlebar_bg = '#1e1e2e',
  inactive_titlebar_bg = '#1e1e2e',
}

config.colors = {
  tab_bar = {
    background = '#1e1e2e',
    active_tab = {
      bg_color = '#cba6f7',
      fg_color = '#1e1e2e',
    },
    inactive_tab = {
      bg_color = '#1e1e2e',
      fg_color = '#6c7086',
    },
  },
}

-- Cmd+1-9 to switch tmux windows (sends Alt+1-9)
config.keys = {}
for i = 1, 9 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CMD',
    action = wezterm.action.SendString('\x1b' .. tostring(i)),
  })
end

return config
