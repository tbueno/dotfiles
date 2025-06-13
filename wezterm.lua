-- Pull in the wezterm API
local wezterm = require 'wezterm'
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()


config.default_cwd = "~/dev"


config.scrollback_lines = 5000


-- LOOK AND FEEL
config.color_scheme = 'Tokyo Night'
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
  { key = 'f', mods = 'SUPER', action = act.Search { CaseSensitiveString = '' } },
  { key = '\\', mods = 'CTRL', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' }, },
  { key = '-', mods = 'CTRL', action = act.SplitVertical{ domain =  'CurrentPaneDomain' } },
  { key = '+', mods = 'SUPER|CTRL', action = act.IncreaseFontSize },
  { key = '-', mods = 'SUPER|CTRL', action = act.DecreaseFontSize },
  { key = '[', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(-1) },
  { key = ']', mods = 'SHIFT|SUPER', action = act.ActivateTabRelative(1) },
  { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
  { key = 'h', mods = 'SUPER', action = act.ActivatePaneDirection 'Left', },
  { key = 'j', mods = 'SUPER', action = act.ActivatePaneDirection 'Down', },
  { key = 'l', mods = 'SUPER', action = act.ActivatePaneDirection 'Right', },
  { key = 'k', mods = 'SUPER', action = act.ActivatePaneDirection 'Up', },
  { key = 'r', mods = 'SUPER', action = act.ReloadConfiguration },
  { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
  { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
  { key = 'w', mods = 'SUPER', action = act.CloseCurrentPane{ confirm = true } },
  { key = 'Tab', mods = 'SHIFT|CTRL', action = act.ActivateTabRelative(-1) },
  { key = 'Tab', mods = 'CTRL', action = act.ActivateTabRelative(1) },
}

-- return the configuration to wezterm
return config
