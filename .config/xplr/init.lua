version = "0.21.1"

local xplr = xplr

xplr.config.general.enable_mouse = true
xplr.config.general.show_hidden = true
xplr.config.general.enable_recover_mode = false

local key = xplr.config.modes.builtin.default.key_bindings.on_key

key.e = xplr.config.modes.builtin.action.key_bindings.on_key.e -- open editor
key.o = xplr.config.modes.builtin.go_to.key_bindings.on_key.x -- open gui
key.L = key["ctrl-i"] -- next visited path
key.H = key["ctrl-o"] -- prev visited path
key["ctrl-i"] = nil
key["ctrl-o"] = nil

key.c = xplr.config.modes.builtin.action.key_bindings.on_key.c -- create mode

key["!"] = {
	help = "shell",
	messages = {
		{ Call = { command = "zsh", args = { "-i", "-l" } } },
		"ExplorePwdAsync",
		"PopMode",
	},
}
