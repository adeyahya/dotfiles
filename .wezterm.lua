local wezterm = require 'wezterm'
local config = {}

config.color_scheme = 'Catppuccin Mocha'
config.font =
  wezterm.font('JetBrains Mono', { weight = 'Bold', italic = true })
config.font_size = 14.0

-- disable tabbar
config.enable_tab_bar = false

return config
