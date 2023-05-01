return function()
	local transparent_background = require("core.settings").transparent_background

	require("vscode").setup({
		transparent = transparent_background,
		italic_comments = true,
		disable_nvimtree_bg = false,
	})
end
