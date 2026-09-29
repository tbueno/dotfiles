-- Pull in the wezterm API
local wezterm = require("wezterm")
local act = wezterm.action

-- This will hold the configuration.
local config = wezterm.config_builder()

config.front_end = "WebGpu"

config.default_cwd = wezterm.home_dir .. "/dev"

config.scrollback_lines = 5000

-- LOOK AND FEEL
config.color_scheme = "catppuccin-macchiato"
config.font = wezterm.font("JetBrains Mono")
config.font_size = 16

config.window_background_opacity = 0.9
config.macos_window_background_blur = 10

-- Remove the title bar from the windown, since it is quite useles
-- 'RESIZE' here means that the title bar is gone, but I can still resize
-- the window with the mouse.

config.window_decorations = "RESIZE"

-- - Tab bar styling
-- The tabs are drawn by format-tab-title below, so the frame and the new tab button
-- have to be colored by hand to match. catppuccin-macchiato, as above.
local palette = {
	mantle = "#1e2030",
	base = "#24273a",
	surface0 = "#363a4f",
	surface1 = "#494d64",
	subtext0 = "#a5adcb",
	text = "#cad3f5",
	mauve = "#c6a0f6",
}

config.window_frame = {
	font = wezterm.font({ family = "JetBrains Mono", weight = "Regular" }),
	active_titlebar_bg = palette.mantle,
	inactive_titlebar_bg = palette.mantle,
}

config.colors = {
	tab_bar = {
		new_tab = { bg_color = palette.mantle, fg_color = palette.subtext0 },
		new_tab_hover = { bg_color = palette.surface1, fg_color = palette.text },
	},
}

-- - Tab titles
-- Show the working directory rather than the running program, so a window full of
-- tabs stays readable.
local tab_colors = {
	active = { bg = palette.mauve, fg = palette.base },
	hover = { bg = palette.surface1, fg = palette.text },
	inactive = { bg = palette.surface0, fg = palette.subtext0 },
}

-- Takes the raw cwd value: `pane.current_working_dir` off the table handed to
-- format-tab-title, or `pane:get_current_working_dir()` off a real Pane object.
local function cwd_path(cwd)
	if not cwd then
		return nil
	end

	-- Recent wezterm hands back a Url object; older ones a "file://host/path" string.
	if type(cwd) == "userdata" then
		return cwd.file_path
	end
	return (tostring(cwd):gsub("^file://[^/]*", ""))
end

local function basename(path)
	if not path or path == "" then
		return nil
	end
	if path == wezterm.home_dir or path == wezterm.home_dir .. "/" then
		return "~"
	end
	return path:match("([^/]+)/?$")
end

local function has_unseen_output(tab)
	for _, pane in ipairs(tab.panes) do
		if pane.has_unseen_output then
			return true
		end
	end
	return false
end

-- An explicitly set title always wins, so `wezterm cli set-tab-title` keeps working.
local function tab_title(tab)
	if tab.tab_title and #tab.tab_title > 0 then
		return tab.tab_title
	end
	return basename(cwd_path(tab.active_pane.current_working_dir)) or tab.active_pane.title
end

wezterm.on("format-tab-title", function(tab, _, _, _, hover, max_width)
	local colors = tab_colors.inactive
	if tab.is_active then
		colors = tab_colors.active
	elseif hover then
		colors = tab_colors.hover
	end

	local marker = has_unseen_output(tab) and " ●" or ""
	local prefix = " " .. (tab.tab_index + 1) .. " "
	-- ● is multi-byte, so reserve its display width rather than its length.
	local marker_width = marker == "" and 0 or 2
	local available = math.max(max_width - #prefix - marker_width - 1, 1)

	return {
		{ Background = { Color = colors.bg } },
		{ Foreground = { Color = colors.fg } },
		{ Text = prefix .. wezterm.truncate_right(tab_title(tab), available) .. marker .. " " },
	}
end)

config.tab_max_width = 28

-- FILE LINKS
-- Shift-clicking a path opens it in nvim, in a floating pane of the zellij session the
-- click came from. The rule goes after the defaults so real URLs still match first.
--
-- Only absolute and ~-rooted paths are linked. Relative ones are deliberately left
-- alone: zellij forwards OSC 7 only intermittently, so wezterm's idea of the pane cwd
-- is stale under it and a relative path would resolve against the wrong directory.
-- The character before the path is matched but excluded from the link, so that
-- `src/main.rs` cannot match as `/main.rs`.

config.hyperlink_rules = wezterm.default_hyperlink_rules()
table.insert(config.hyperlink_rules, {
	regex = [[(?:^|[^\w.\-~/])((?:~)?(?:/[\w.\-]+)+(?::\d+)?(?::\d+)?)]],
	format = "edit:$1",
	highlight = 1,
})

local function expand_home(path)
	if path:sub(1, 1) == "~" then
		return wezterm.home_dir .. path:sub(2)
	end
	return path
end

-- Zellij always prefixes the terminal title with its session name, so the title is the
-- only place the wezterm pane -> zellij session mapping is available.
local function zellij_session(pane)
	return pane:get_title():match("^Zellij %((.-)%)")
end

local function shell_quote(str)
	return "'" .. str:gsub("'", [['\'']]) .. "'"
end

-- Zellij places a floating pane by its top-left corner, so centering one means
-- insetting it by half of whatever the size leaves over.
local float_size = 70
local float_inset = (100 - float_size) / 2
local float_geometry = string.format(
	"--floating --width %d%% --height %d%% -x %d%% -y %d%%",
	float_size,
	float_size,
	float_inset,
	float_inset
)

local function file_exists(path)
	local handle = io.open(path, "r")
	if not handle then
		return false
	end
	handle:close()
	return true
end

wezterm.on("open-uri", function(_, pane, uri)
	local target = uri:match("^edit:(.+)$")
	if not target then
		-- A real URL: let wezterm hand it to the default opener.
		return true
	end

	-- Only handled inside zellij; a click anywhere else is a no-op.
	local session = zellij_session(pane)
	if not session then
		return false
	end

	local path, line = target:match("^(.-):(%d+)")
	path = expand_home(path or target)

	-- A match that isn't a real file is a no-op rather than a stray editor pane.
	if not file_exists(path) then
		return false
	end

	local editor = "nvim"
	if line then
		editor = editor .. " +" .. line
	end
	editor = editor .. " " .. shell_quote(path)

	-- wezterm.app is launched from the Dock, so it inherits a bare PATH rather than the
	-- shell's. Going through a login shell finds nvim and zellij wherever they live, and
	-- gives nvim a real PATH for its own subprocesses.
	wezterm.background_child_process({
		"/bin/zsh",
		"-lc",
		"zellij --session "
			.. shell_quote(session)
			.. " action new-pane --close-on-exit "
			.. float_geometry
			.. " -- "
			.. editor,
	})
	return false
end)

-- KEY BINDINGS

config.disable_default_key_bindings = true
config.keys = {
	{ key = "f", mods = "SUPER", action = act.Search({ CaseSensitiveString = "" }) },
	{ key = "\\", mods = "CTRL", action = act.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
	{ key = "-", mods = "CTRL", action = act.SplitVertical({ domain = "CurrentPaneDomain" }) },
	{ key = "+", mods = "SUPER|CTRL", action = act.IncreaseFontSize },
	{ key = "-", mods = "SUPER|CTRL", action = act.DecreaseFontSize },
	{ key = "[", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(-1) },
	{ key = "]", mods = "SHIFT|SUPER", action = act.ActivateTabRelative(1) },
	{ key = "c", mods = "SUPER", action = act.CopyTo("Clipboard") },
	{ key = "h", mods = "SUPER", action = act.ActivatePaneDirection("Left") },
	{ key = "j", mods = "SUPER", action = act.ActivatePaneDirection("Down") },
	{ key = "l", mods = "SUPER", action = act.ActivatePaneDirection("Right") },
	{ key = "k", mods = "SUPER", action = act.ActivatePaneDirection("Up") },
	{ key = "r", mods = "SUPER", action = act.ReloadConfiguration },
	{ key = "t", mods = "SUPER", action = act.SpawnTab("CurrentPaneDomain") },
	{ key = "v", mods = "SUPER", action = act.PasteFrom("Clipboard") },
	{ key = "w", mods = "SUPER", action = act.CloseCurrentPane({ confirm = true }) },
	{ key = "Tab", mods = "SHIFT|CTRL", action = act.ActivateTabRelative(-1) },
	{ key = "Tab", mods = "CTRL", action = act.ActivateTabRelative(1) },
}

-- return the configuration to wezterm
return config
