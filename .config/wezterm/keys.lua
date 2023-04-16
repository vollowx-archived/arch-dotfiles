local wezterm = require("wezterm")
local act = wezterm.action

local shortcuts = {}

local map = function(key, mods, action)
	if type(mods) == "string" then
		table.insert(shortcuts, { key = key, mods = mods, action = action })
	elseif type(mods) == "table" then
		for _, mod in pairs(mods) do
			table.insert(shortcuts, { key = key, mods = mod, action = action })
		end
	end
end

wezterm.GLOBAL.enable_tab_bar = true
local toggleTabBar = wezterm.action_callback(function(window)
	wezterm.GLOBAL.enable_tab_bar = not wezterm.GLOBAL.enable_tab_bar
	window:set_config_overrides({
		enable_tab_bar = wezterm.GLOBAL.enable_tab_bar,
	})
end)

local openUrl = act.QuickSelectArgs({
	label = "open url",
	patterns = { "https?://\\S+" },
	action = wezterm.action_callback(function(window, pane)
		local url = window:get_selection_text_for_pane(pane)
		wezterm.open_with(url)
	end),
})

-- use 'Backslash' to split horizontally
map("\\", "LEADER", act.SplitHorizontal({ domain = "CurrentPaneDomain" }))
-- and 'Minus' to split vertically
map("-", "LEADER", act.SplitVertical({ domain = "CurrentPaneDomain" }))
-- map 1-9 to switch to tab 1-9, 0 for the last tab
for i = 1, 9 do
	map(tostring(i), "ALT|SHIFT", act.ActivateTab(i - 1))
end
map("0", "SHIFT|CTRL", act.ActivateTab(-1))
-- 'hjkl' to move between panes
map("h", "SHIFT|CTRL", act.ActivatePaneDirection("Left"))
map("j", "SHIFT|CTRL", act.ActivatePaneDirection("Down"))
map("k", "SHIFT|CTRL", act.ActivatePaneDirection("Up"))
map("l", "SHIFT|CTRL", act.ActivatePaneDirection("Right"))
-- resize
map("h", "ALT|SHIFT", act.AdjustPaneSize({ "Left", 1 }))
map("j", "ALT|SHIFT", act.AdjustPaneSize({ "Down", 1 }))
map("k", "ALT|SHIFT", act.AdjustPaneSize({ "Up", 1 }))
map("l", "ALT|SHIFT", act.AdjustPaneSize({ "Right", 1 }))
-- spawn & close
map("q", "SHIFT|CTRL", act.CloseCurrentPane({ confirm = true }))
map("t", "SHIFT|CTRL", act.SpawnTab("CurrentPaneDomain"))
map("w", "SHIFT|CTRL", act.CloseCurrentTab({ confirm = true }))
map("n", "SHIFT|CTRL", act.SpawnWindow)
-- zoom states
map("z", "SHIFT|CTRL", act.TogglePaneZoomState)
map("Z", "SHIFT|CTRL", toggleTabBar)
-- copy & paste
map("v", "LEADER", act.ActivateCopyMode)
map("c", "SHIFT|CTRL", act.CopyTo("Clipboard"))
map("v", "SHIFT|CTRL", act.PasteFrom("Clipboard"))
map("f", "SHIFT|CTRL", act.Search("CurrentSelectionOrEmptyString"))
-- rotation
map("e", "SHIFT|CTRL", act.RotatePanes("Clockwise"))
-- pickers
map(" ", "LEADER", act.QuickSelect)
map("o", "LEADER", openUrl)
map("p", "LEADER", act.PaneSelect({ alphabet = "asdfghjkl;" }))
map("R", "LEADER", act.ReloadConfiguration)
map("u", "SHIFT|CTRL", act.CharSelect)
map("p", "SHIFT|CTRL", act.ActivateCommandPalette)
-- view
map("-", "SHIFT|CTRL", act.DecreaseFontSize)
map("=", "SHIFT|CTRL", act.IncreaseFontSize)
map("0", "SHIFT|CTRL", act.ResetFontSize)
-- debug
map("d", "SHIFT|CTRL", act.ShowDebugOverlay)

local key_tables = {}

-- add a common escape sequence to all key tables
for k, _ in pairs(key_tables) do
	table.insert(key_tables[k], { key = "Escape", action = "PopKeyTable" })
	table.insert(key_tables[k], { key = "Enter", action = "PopKeyTable" })
	table.insert(key_tables[k], { key = "c", mods = "CTRL", action = "PopKeyTable" })
end

local M = {}
M.apply = function(c)
	c.leader = {
		key = " ",
		mods = "ALT",
		timeout_milliseconds = math.maxinteger,
	}
	c.keys = shortcuts
	c.disable_default_key_bindings = true
	c.key_tables = key_tables
	c.mouse_bindings = {
		{
			event = { Down = { streak = 1, button = { WheelUp = 1 } } },
			mods = "NONE",
			action = wezterm.action.ScrollByLine(5),
		},
		{
			event = { Down = { streak = 1, button = { WheelDown = 1 } } },
			mods = "NONE",
			action = wezterm.action.ScrollByLine(-5),
		},
	}
end
return M
