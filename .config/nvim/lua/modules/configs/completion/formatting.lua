local M = {}

local settings = require("core.settings")
local disabled_workspaces = settings.formatDisabledDirs
local formatOnSave = settings.formatOnSave

vim.api.nvim_create_user_command("FormatToggle", function()
	M.toggle_formatOnSave()
end, {})

local block_list = {}
vim.api.nvim_create_user_command("FormatterToggle", function(opts)
	if block_list[opts.args] == nil then
		vim.notify(
			string.format("[LSP]Formatter for [%s] has been recorded in list and disabled.", opts.args),
			vim.log.levels.WARN,
			{ title = "LSP Formatter Warning!" }
		)
		block_list[opts.args] = true
	else
		block_list[opts.args] = not block_list[opts.args]
		vim.notify(
			string.format(
				"[LSP]Formatter for [%s] has been %s.",
				opts.args,
				not block_list[opts.args] and "enabled" or "disabled"
			),
			not block_list[opts.args] and vim.log.levels.INFO or vim.log.levels.WARN,
			{ title = string.format("LSP Formatter %s", not block_list[opts.args] and "Info" or "Warning") }
		)
	end
end, {
	nargs = 1,
	complete = function()
		return {
			"markdown",
			"vim",
			"lua",
			"c",
			"cpp",
			"python",
			"vue",
			"typescript",
			"javascript",
			"yaml",
			"html",
			"css",
			"scss",
			"sh",
			"rust",
		}
	end,
})

function M.enable_formatOnSave(is_configured)
	local opts = { pattern = "*", timeout = 1000 }
	vim.api.nvim_create_augroup("formatOnSave", {})
	vim.api.nvim_create_autocmd("BufWritePre", {
		group = "formatOnSave",
		pattern = opts.pattern,
		callback = function()
			require("completion.formatting").format({ timeout_ms = opts.timeout, filter = M.format_filter })
		end,
	})
	if not is_configured then
		vim.notify(
			"Successfully enabled format-on-save",
			vim.log.levels.INFO,
			{ title = "Settings modification success!" }
		)
	end
end

function M.disable_formatOnSave()
	pcall(vim.api.nvim_del_augroup_by_name, "formatOnSave")
	if formatOnSave then
		vim.notify("Disabled format-on-save", vim.log.levels.INFO, { title = "Settings modification success!" })
	end
end

function M.configure_formatOnSave()
	if formatOnSave then
		M.enable_formatOnSave(true)
	else
		M.disable_formatOnSave()
	end
end

function M.toggle_formatOnSave()
	local status = pcall(vim.api.nvim_get_autocmds, {
		group = "formatOnSave",
		event = "BufWritePre",
	})
	if not status then
		M.enable_formatOnSave(false)
	else
		M.disable_formatOnSave()
	end
end

function M.format_filter(clients)
	return vim.tbl_filter(function(client)
		local status_ok, formatting_supported = pcall(function()
			return client.supports_method("textDocument/formatting")
		end)
		if status_ok and formatting_supported and client.name == "efm" then
			return "efm"
		elseif client.name ~= "sumneko_lua" and client.name ~= "tsserver" and client.name ~= "clangd" then
			return status_ok and formatting_supported and client.name
		end
	end, clients)
end

function M.format(opts)
	local cwd = vim.fn.getcwd()
	for i = 1, #disabled_workspaces do
		if cwd.find(cwd, disabled_workspaces[i]) ~= nil then
			return
		end
	end

	local bufnr = opts.bufnr or vim.api.nvim_get_current_buf()
	local clients = vim.lsp.buf_get_clients(bufnr)

	if opts.filter then
		clients = opts.filter(clients)
	elseif opts.id then
		clients = vim.tbl_filter(function(client)
			return client.id == opts.id
		end, clients)
	elseif opts.name then
		clients = vim.tbl_filter(function(client)
			return client.name == opts.name
		end, clients)
	end

	clients = vim.tbl_filter(function(client)
		return client.supports_method("textDocument/formatting")
	end, clients)

	if #clients == 0 then
		vim.notify(
			"[LSP] Format request failed, no matching language servers.",
			vim.log.levels.WARN,
			{ title = "Formatting Failed!" }
		)
	end

	local timeout_ms = opts.timeout_ms
	for _, client in pairs(clients) do
		if block_list[vim.bo.filetype] == true then
			vim.notify(
				string.format(
					"[LSP][%s] formatter for [%s] has been disabled. This file was not processed.",
					client.name,
					vim.bo.filetype
				),
				vim.log.levels.WARN,
				{ title = "LSP Formatter Warning!" }
			)
			return
		end
		local params = vim.lsp.util.make_formatting_params(opts.formatting_options)
		local result, err = client.request_sync("textDocument/formatting", params, timeout_ms, bufnr)
		if result and result.result then
			vim.lsp.util.apply_text_edits(result.result, bufnr, client.offset_encoding)
			vim.notify(
				string.format("Format successfully with %s!", client.name),
				vim.log.levels.INFO,
				{ title = "LSP Format Success!" }
			)
		elseif err then
			vim.notify(
				string.format("[LSP][%s] %s", client.name, err),
				vim.log.levels.ERROR,
				{ title = "LSP Format Error!" }
			)
		end
	end
end

return M