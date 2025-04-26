local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font 'DroidSansMono Nerd Font'
config.font_size = 14.0

-- Color scheme
config.color_scheme = 'Kanagawa Dragon (Gogh)'

-- Keybinds
config.keys = {
  -- Fullscreen
  {
    key = 'F11',
    action = wezterm.action.ToggleFullScreen,
  },
  -- Create a new tab in the same domain as the current pane.
  {
    key = 't',
    mods = 'CTRL|SHIFT',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
}
-- Keybinds to go to the Nth tab with CTRL+NUM
for i = 1, 8 do
  table.insert(config.keys, {
    key = tostring(i),
    mods = 'CTRL|SHIFT',
    action = act.ActivateTab(i - 1),
  })
end

-- Keybinds to go to the next/previous tab
table.insert(config.keys, { key = 'LeftArrow', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) })
table.insert(config.keys, { key = 'RightArrow', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) })

-- This seems to imrpove performance, idk
config.front_end = "WebGpu"

return config
