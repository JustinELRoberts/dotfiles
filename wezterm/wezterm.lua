local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Font
config.font = wezterm.font 'DroidSansM Nerd Font'
config.font_size = 14.0

-- Color scheme; autonatically choose light vs dark mode depending on OS settings
local appearance = wezterm.gui.get_appearance()
if appearance == 'Dark' then
  config.color_scheme = 'Kanagawa Dragon (Gogh)'
else
  config.color_scheme = 'Kanagawa (Gogh)'
end

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

-- Keybinds to go to the next/previous tab
table.insert(config.keys, { key = 'j', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(-1) })
table.insert(config.keys, { key = 'k', mods = 'CTRL|SHIFT', action = act.ActivateTabRelative(1) })

-- Keybinds to move the currently selected tab
table.insert(config.keys, { key = 'h', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(-1) })
table.insert(config.keys, { key = 'l', mods = 'CTRL|SHIFT', action = act.MoveTabRelative(1) })

-- This seems to imrpove performance, idk
config.front_end = "WebGpu"

-- Turn off stupid bell noise
config.audible_bell = "Disabled"

-- Remove window padding (use entire window for things like nvim)
config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

return config
