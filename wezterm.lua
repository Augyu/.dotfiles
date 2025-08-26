-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- Font configuration
config.font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold' })
config.font_size = 18.0

-- For example, changing the color scheme:
config.color_scheme = 'Catppuccin Mocha'

-- Window behavior configuration
config.window_padding = {
  left = 20,
  right = 20,
  top = 20,
  bottom = 20,
}

-- Session management
config.default_workspace = 'main'

-- Tab configuration
config.hide_tab_bar_if_only_one_tab = true
config.tab_max_width = 25
config.show_tab_index_in_tab_bar = true

-- Custom tab title formatting to show process and brief path
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local cwd = tab.active_pane.current_working_dir
  local process = tab.active_pane.foreground_process_name
  local title = tab.tab_index + 1 .. ': '
  
  -- Add process name if available
  if process then
    local process_name = process:match('([^/]+)$') or process
    title = title .. process_name .. ' '
  end
  
  -- Add brief path (last 2 directories)
  if cwd then
    local path = cwd.file_path
    local brief_path = path:match('([^/]+/[^/]+)/?$') or path:match('([^/]+)/?$') or path
    title = title .. '(' .. brief_path .. ')'
  end
  
  return title
end)

config.window_frame = {
  -- Tab bar font configuration
  font = wezterm.font('JetBrainsMono Nerd Font', { weight = 'Bold' }),
  font_size = 14.0,

  -- The overall background color of the tab bar when
  -- the window is focused
  active_titlebar_bg = '#333333',

  -- The overall background color of the tab bar when
  -- the window is not focused
  inactive_titlebar_bg = '#333333',
}

config.colors = {
  tab_bar = {
    -- The color of the inactive tab bar edge/divider
    inactive_tab_edge = '#575757',
  },
}

-- Keybindings (tmux handles pane management now)
config.keys = {}

-- and finally, return the configuration to wezterm
return config
