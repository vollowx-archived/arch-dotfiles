return function()
	local colors = require("modules.utils").get_palette()
	local icons = {
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
		misc = require("modules.utils.icons").get("misc", true),
		git = require("modules.utils.icons").get("git", true),
		ui = require("modules.utils.icons").get("ui", true),
	}
	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
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
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
			lualine_b = { "branch" },
			lualine_c = {
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
				"filename",
			},
			lualine_x = {
				{
					"diff",
					colored = false,
					symbols = {
						added = icons.git.Add,
						modified = icons.git.Mod,
						removed = icons.git.Remove,
					}, -- changes diff symbols
					cond = hide_in_width,
				},
				{ "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth") },
				"encoding",
				"filetype",
			},
			lualine_y = { "progress" },
			lualine_z = { { "location", separator = { right = "" }, left_padding = 2 } },
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
