-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This table will hold the configuration.
local config = {}

config.default_prog = { "usr/bin/zsh", "-l" }
-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
	config = wezterm.config_builder()
end

-- For example, changing the color scheme:
config.color_scheme = "Catppuccin Mocha"
config.font_size = 11

config.window_decorations = "TITLE | RESIZE"

-- tmux
config.keys = {
	{
		mods = "ALT",
		key = "c",
		action = wezterm.action.SpawnTab("CurrentPaneDomain"),
	},
	{
		mods = "ALT",
		key = "x",
		action = wezterm.action.CloseCurrentPane({ confirm = false }),
	},
	{
		mods = "ALT",
		key = "b",
		action = wezterm.action.ActivateTabRelative(-1),
	},
	{
		mods = "ALT",
		key = "n",
		action = wezterm.action.ActivateTabRelative(1),
	},
	{
		mods = "ALT",
		key = "v",
		action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "ALT",
		key = "g",
		action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }),
	},
	{
		mods = "ALT",
		key = "h",
		action = wezterm.action.ActivatePaneDirection("Left"),
	},
	{
		mods = "ALT",
		key = "j",
		action = wezterm.action.ActivatePaneDirection("Down"),
	},
	{
		mods = "ALT",
		key = "k",
		action = wezterm.action.ActivatePaneDirection("Up"),
	},
	{
		mods = "ALT",
		key = "l",
		action = wezterm.action.ActivatePaneDirection("Right"),
	},
	{
		mods = "ALT",
		key = "LeftArrow",
		action = wezterm.action.AdjustPaneSize({ "Left", 5 }),
	},
	{
		mods = "ALT",
		key = "RightArrow",
		action = wezterm.action.AdjustPaneSize({ "Right", 5 }),
	},
	{
		mods = "ALT",
		key = "DownArrow",
		action = wezterm.action.AdjustPaneSize({ "Down", 5 }),
	},
	{
		mods = "ALT",
		key = "UpArrow",
		action = wezterm.action.AdjustPaneSize({ "Up", 5 }),
	},
}

config.window_padding = {
	top = 0,
	bottom = 0,
}

for i = 0, 9 do
	-- leader + number to activate that tab
	table.insert(config.keys, {
		key = tostring(i),
		mods = "LEADER",
		action = wezterm.action.ActivateTab(i),
	})
end

-- tab bar
config.hide_tab_bar_if_only_one_tab = true
config.tab_bar_at_bottom = true
config.use_fancy_tab_bar = false
config.tab_and_split_indices_are_zero_based = false

-- and finally, return the configuration to wezterm
return config
