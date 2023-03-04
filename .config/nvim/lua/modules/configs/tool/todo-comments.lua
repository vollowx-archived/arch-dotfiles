return function()
	local icons = {
		ui = require("modules.utils.icons").get("ui"),
		diagnostics = require("modules.utils.icons").get("diagnostics"),
	}

	-- FIXME: to test the FIXME style
	-- FIX: to test the FIX style
	-- TODO: to test the TODO style
	-- HACK: to test the HACK style
	-- WARN: to test the WARN style
	-- PERF: to test the PERF style
	-- NOTE: to test the NOTE style
	-- TEST: to test the TEST style
	require("todo-comments").setup({
		signs = true, -- show icons in the signs column
		sign_priority = 8, -- sign priority
		-- keywords recognized as todo comments
		keywords = {
			FIX = {
				icon = icons.ui.Bug, -- icon used for the sign, and in search results
				color = "error", -- can be a hex color, or a named color (see below)
				alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
				-- signs = false, -- configure signs for some keywords individually
			},
			TODO = { icon = icons.ui.Check, color = "info" },
			HACK = { icon = icons.ui.Fire, color = "warning" },
			WARN = { icon = icons.diagnostics.Warning, color = "warning", alt = { "WARNING", "XXX" } },
			PERF = { icon = icons.ui.Perf, alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
			NOTE = { icon = icons.ui.Note, color = "hint", alt = { "INFO" } },
			TEST = { icon = icons.ui.Test, color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
		},
		gui_style = {
			fg = "NONE", -- The gui style to use for the fg highlight group.
			bg = "BOLD", -- The gui style to use for the bg highlight group.
		},
		merge_keywords = true, -- when true, custom keywords will be merged with the defaults
		-- highlighting of the line containing the todo comment
		-- * before: highlights before the keyword (typically comment characters)
		-- * keyword: highlights of the keyword
		-- * after: highlights after the keyword (todo text)
		highlight = {
			multiline = true, -- enable multine todo comments
			multiline_pattern = "^.", -- lua pattern to match the next multiline from the start of the matched keyword
			multiline_context = 10, -- extra lines that will be re-evaluated when changing a line
			before = "", -- "fg" or "bg" or empty
			keyword = "wide", -- "fg", "bg", "wide", "wide_bg", "wide_fg" or empty. (wide and wide_bg is the same as bg, but will also highlight surrounding characters, wide_fg acts accordingly but with fg)
			after = "fg", -- "fg" or "bg" or empty
			pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
			comments_only = true, -- uses treesitter to match keywords in comments only
			max_line_len = 400, -- ignore lines longer than this
			exclude = {}, -- list of file types to exclude highlighting
		},
		search = {
			command = "rg",
			args = {
				"--color=never",
				"--no-heading",
				"--with-filename",
				"--line-number",
				"--column",
			},
			pattern = [[\b(KEYWORDS):]], -- ripgrep regex
		},
	})
end
