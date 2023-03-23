return function()
	local colors = require("modules.utils").get_palette()
	local icons = {
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
		misc = require("modules.utils.icons").get("misc", true),
		git = require("modules.utils.icons").get("git", true),
		ui = require("modules.utils.icons").get("ui", true),
	}
	local hide_in_width = function()
		return vim.fn.winwidth(0) > 120
	end

	local mini_sections = {
		lualine_a = { "filetype" },
		lualine_b = {},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	}
	local outline = {
		sections = mini_sections,
		filetypes = { "lspsagaoutline" },
	}
	local diffview = {
		sections = mini_sections,
		filetypes = { "DiffviewFiles" },
	}

	require("lualine").setup({
		options = {
			icons_enabled = true,
			theme = "catppuccin",
			disabled_filetypes = { "alpha", "dashboard" },
			component_separators = "|",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { "mode" },
			lualine_b = {
				-- work folder
				{
					function()
						return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
					end,
					cond = hide_in_width,
				},
				"filename",
			},
			lualine_c = {
				{ "branch", icon = " " },
				{
					"diff",
					symbols = {
						added = icons.git.Add,
						modified = icons.git.Mod,
						removed = icons.git.Remove,
					},
					cond = hide_in_width,
				},
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					sections = { "error", "warn" },
					symbols = {
						error = icons.diagnostics.Error,
						warn = icons.diagnostics.Warning,
					},
					always_visible = true,
				},
				-- lsps
				{
					function()
						local client_names = {}
						for _, client in ipairs(vim.lsp.get_active_clients()) do
							table.insert(client_names, client.name)
						end
						return "[" .. table.concat(client_names, "] [") .. "]"
					end,
					cond = hide_in_width,
				},
			},
			lualine_y = {
				"encoding",
				"filetype",
			},
			lualine_z = { "progress", "location" },
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "location" },
			lualine_y = {},
			lualine_z = {},
		},
		tabline = {},
		extensions = {
			"quickfix",
			"nvim-tree",
			"nvim-dap-ui",
			"toggleterm",
			"fugitive",
			outline,
			diffview,
		},
	})

	-- Properly set background color for lspsaga
	local winbar_bg = require("modules.utils").hl_to_rgb("StatusLine", true, colors.mantle)
	for _, hlGroup in pairs(require("lspsaga.lspkind").get_kind_group()) do
		require("modules.utils").extend_hl(hlGroup, { bg = winbar_bg })
	end
end
