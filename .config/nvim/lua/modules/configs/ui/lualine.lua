return function()
	local colors = require("modules.utils").get_palette()
	local icons = {
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
		misc = require("modules.utils.icons").get("misc", false),
		git = require("modules.utils.icons").get("git", true),
		ui = require("modules.utils.icons").get("ui", true),
	}
	local hide_in_width = function()
		return vim.fn.winwidth(0) > 120
	end

	local has_value = function(arr, val)
		for _, value in ipairs(arr) do
			if value == val then
				return true
			end
		end
		return false
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
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		sections = {
			lualine_a = {
				{
					"mode",
					icon = icons.misc.Vim,
				},
			},
			lualine_b = {
				{
					"filetype",
					icon_only = true,
					padding = {
						left = 1,
						right = 0,
					},
				},
				"filename",
			},
			lualine_c = {
				{
					"branch",
					icon = " ",
					padding = {
						left = 1,
						right = 0,
					},
				},
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
				-- lsp
				{
					function()
						local msg = "No Active Lsp"
						local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
						local clients = vim.lsp.get_active_clients()
						if next(clients) == nil then
							return msg
						end
						for _, client in ipairs(clients) do
							local filetypes = client.config.filetypes
							if
								filetypes
								and vim.fn.index(filetypes, buf_ft) ~= -1
								and not has_value({ "copilot", "null-ls" }, client.name)
							then
								return "[" .. client.name .. "]"
							end
						end
						return msg
					end,
					padding = {
						left = 0,
						right = 1,
					},
					cond = hide_in_width,
				},
			},
			lualine_y = {
				"encoding",
			},
			lualine_z = { "location" },
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
