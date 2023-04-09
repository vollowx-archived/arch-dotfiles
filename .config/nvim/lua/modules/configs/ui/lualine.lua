return function()
	local icons = {
		diagnostics = require("modules.utils.icons").get("diagnostics", true),
		misc = require("modules.utils.icons").get("misc", false),
		git = require("modules.utils.icons").get("git", true),
		ui = require("modules.utils.icons").get("ui", true),
	}
	local hide_in_width = function()
		return vim.fn.winwidth(0) > 80
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
			theme = "auto",
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
					colored = false,
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
					-- to remove a whitespace
					icon = string.sub(icons.git.Branch, 1, 3),
					padding = {
						left = 1,
						right = 0,
					},
					cond = hide_in_width,
				},
				{
					"diff",
					symbols = {
						added = icons.git.Add,
						modified = icons.git.Mod,
						removed = icons.git.Remove,
					},
				},
			},
			lualine_x = {
				{
					"diagnostics",
					sources = { "nvim_lsp" },
					sections = { "error", "warn", "info", "hint" },
					symbols = {
						error = icons.diagnostics.Error,
						warn = icons.diagnostics.Warning,
						info = icons.diagnostics.Information,
						hint = icons.diagnostics.Hint,
					},
				},
				-- lsp
				{
					function()
						local msg = "[]"
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
								and not has_value({ "null-ls" }, client.name)
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
				},
			},
			lualine_y = {
				{
					"fileformat",
					symbols = {
						unix = "",
						dos = "",
						mac = "",
					},
				},
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
end
