-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()


config.default_cwd = "~/dev"


config.scrollback_lines = 5000


-- LOOK AND FEEL
config.color_scheme = 'Afterglow'
config.font = wezterm.font 'JetBrains Mono'

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10


-- - Tab bar styling
config.window_frame = {
  font = wezterm.font { family = 'Noto Sans', weight = 'Regular' },
 }


-- KEY BINDINGS

config.disable_default_key_bindings = true
config.keys = {
  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
  { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 't', mods = 'CMD', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'w', mods = 'CMD', action = act.CloseCurrentPane{ confirm = true } },
  { key = '\\', mods = 'CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = '-', mods = 'CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = 'j', mods = 'CMD', action = act.ActivatePaneDirection 'Down', },
  { key = 'k', mods = 'CMD', action = act.ActivatePaneDirection 'Up', },
  { key = 'h', mods = 'CMD', action = act.ActivatePaneDirection 'Left', },
  { key = 'l', mods = 'CMD', action = act.ActivatePaneDirection 'Right', },
  { key = 'r', mods = 'CMD', action = act.ReloadConfiguration },
}

-- return the configuration to wezterm
return config
