return function()
	require("twilight").setup({
		dimming = {
			alpha = 0.25,
			color = { "Normal", "#ffffff" },
			term_bg = "#000000", -- if guibg=NONE, this will be used to calculate text color
			inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
		},
		context = 10, -- amount of lines we will try to show around the current line
		treesitter = true, -- use treesitter when available for the filetype
		expand = {
			"function",
			"method",
			"table",
			"if_statement",
		},
		exclude = {},
	})
end
