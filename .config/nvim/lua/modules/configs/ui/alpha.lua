return function()
	local alpha = require("alpha")
	local dashboard = require("alpha.themes.dashboard")

	local fn = vim.fn
	local marginTopPercent = 0.3
	local header_padding = fn.max({ 2, fn.floor(fn.winheight(0) * marginTopPercent) })

	require("modules.utils").gen_alpha_hl()

	dashboard.section.header.val = {
		[[  ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆         ]],
		[[   ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦      ]],
		[[         ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄    ]],
		[[          ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄   ]],
		[[         ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀  ]],
		[[  ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄ ]],
		[[ ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄  ]],
		[[⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄ ]],
		[[⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄]],
		[[     ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆    ]],
		[[      ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃    ]],
	}
	dashboard.section.header.opts.hl = "AlphaHeader"

	local function button(sc, txt, leader_txt, keybind, keybind_opts)
		local sc_after = sc:gsub("%s", ""):gsub(leader_txt, "<leader>")

		local opts = {
			position = "center",
			shortcut = sc,
			cursor = 5,
			width = 36,
			align_shortcut = "right",
			hl = "AlphaButtons",
			hl_shortcut = "AlphaShortcut",
		}

		if nil == keybind then
			keybind = sc_after
		end
		keybind_opts = vim.F.if_nil(keybind_opts, { noremap = true, silent = true, nowait = true })
		opts.keymap = { "n", sc_after, keybind, keybind_opts }

		local function on_press()
			-- local key = vim.api.nvim_replace_termcodes(keybind .. '<Ignore>', true, false, true)
			local key = vim.api.nvim_replace_termcodes(sc_after .. "<Ignore>", true, false, true)
			vim.api.nvim_feedkeys(key, "t", false)
		end

		return {
			type = "button",
			val = txt,
			on_press = on_press,
			opts = opts,
		}
	end

	local leader = " "
	dashboard.section.buttons.val = {
		button("space f n", "  New File", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				vim.api.nvim_command("enew")
			end,
		}),
		button("space f c", "  Change Theme", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope.builtin").colorscheme()
			end,
		}),
		button("space f r", "  File Frecency", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope").extensions.frecency.frecency()
			end,
		}),
		button("space f e", "  File History", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope.builtin").oldfiles()
			end,
		}),
		button("space f p", "  Find Project", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope").extensions.projects.projects({})
			end,
		}),
		button("space f f", "  Find File", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope.builtin").find_files()
			end,
		}),
		button("space f w", "  Find Word", leader, nil, {
			noremap = true,
			silent = true,
			nowait = true,
			callback = function()
				require("telescope.builtin").live_grep()
			end,
		}),
	}
	dashboard.section.buttons.opts.hl = "AlphaButtons"

	local function footer()
		local stats = require("lazy").stats()
		local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
		return "  "
			.. vim.version().major
			.. "."
			.. vim.version().minor
			.. "."
			.. vim.version().patch
			.. "  "
			.. stats.count
			.. "  "
			.. ms
			.. "ms"
	end

	dashboard.section.footer.val = footer()
	dashboard.section.footer.opts.hl = "AlphaFooter"

	dashboard.config.layout = {
		{ type = "padding", val = header_padding },
		dashboard.section.header,
		{ type = "padding", val = 2 },
		dashboard.section.buttons,
		{ type = "padding", val = 1 },
		dashboard.section.footer,
	}

	alpha.setup(dashboard.opts)

	vim.api.nvim_create_autocmd("User", {
		pattern = "LazyVimStarted",
		callback = function()
			dashboard.section.footer.val = footer()
			pcall(vim.cmd.AlphaRedraw)
		end,
	})

	-- Disable statusline in dashboard
	vim.api.nvim_create_autocmd("FileType", {
		pattern = "alpha",
		callback = function()
			-- store current statusline value and use that
			local old_laststatus = vim.opt.laststatus
			vim.api.nvim_create_autocmd("BufUnload", {
				buffer = 0,
				callback = function()
					vim.opt.laststatus = old_laststatus
				end,
			})
			vim.opt.laststatus = 0
		end,
	})
end
