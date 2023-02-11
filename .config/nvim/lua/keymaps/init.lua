require("keymaps.helpers")
local bind = require("keymaps.bind")
local map_cr = bind.map_cr
-- local map_cu = bind.map_cu
-- local map_cmd = bind.map_cmd
-- local map_callback = bind.map_callback

local plug_map = {
	-- Package manager: lazy.nvim
	["n|<leader>ph"] = map_cr("Lazy"):with_silent():with_noremap():with_nowait():with_desc("plugins: Show"),
	["n|<leader>ps"] = map_cr("Lazy sync"):with_silent():with_noremap():with_nowait():with_desc("plugins: Sync"),
	["n|<leader>pu"] = map_cr("Lazy update"):with_silent():with_noremap():with_nowait():with_desc("plugins: Update"),
	["n|<leader>pi"] = map_cr("Lazy install"):with_silent():with_noremap():with_nowait():with_desc("plugins: Install"),
	["n|<leader>pl"] = map_cr("Lazy log"):with_silent():with_noremap():with_nowait():with_desc("plugins: Log"),
	["n|<leader>pc"] = map_cr("Lazy check"):with_silent():with_noremap():with_nowait():with_desc("plugins: Check"),
	["n|<leader>pd"] = map_cr("Lazy debug"):with_silent():with_noremap():with_nowait():with_desc("plugins: Debug"),
	["n|<leader>pp"] = map_cr("Lazy profile"):with_silent():with_noremap():with_nowait():with_desc("plugins: Profile"),
	["n|<leader>pr"] = map_cr("Lazy restore"):with_silent():with_noremap():with_nowait():with_desc("plugins: Restore"),
	["n|<leader>px"] = map_cr("Lazy clean"):with_silent():with_noremap():with_nowait():with_desc("plugins: Clean"),
}

bind.nvim_load_mapping(plug_map)

-- Plugin keymaps
require("keymaps.completion")
require("keymaps.editor")
require("keymaps.lang")
require("keymaps.tool")
require("keymaps.ui")
