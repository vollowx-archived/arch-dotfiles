local status_ok, symbols_outline = pcall(require, 'symbols-outline')
if not status_ok then
  return
end

local icons = require('user.icons')

local opts = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = false,
	position = 'right',
	width = 30,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { '<ESC>', 'q' },
		goto_location = '<CR>',
		focus_location = 'o',
		hover_symbol = '<C-space>',
		toggle_preview = 'K',
		rename_symbol = 'r',
		code_actions = 'a',
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = icons.ui.File, hl = 'CmpItemKindFile' },
		Module = { icon = icons.kind.Module, hl = 'CmpItemKindModule' },
		Namespace = { icon = icons.kind.Module, hl = 'CmpItemKindModule' },
		Package = { icon = icons.kind.Module, hl = 'CmpItemKindModule' },
		Class = { icon = icons.kind.Class, hl = 'CmpItemKindClass' },
		Method = { icon = icons.kind.Method, hl = 'CmpItemKindMethod' },
		Property = { icon = icons.kind.Property, hl = 'CmpItemKindProperty' },
		Field = { icon = icons.kind.Field, hl = 'CmpItemKindField' },
		Constructor = { icon = icons.kind.Constructor, hl = 'CmpItemKindConstructor' },
		Enum = { icon = icons.kind.Enum, hl = 'CmpItemKindEnum' },
		Interface = { icon = icons.kind.Interface, hl = 'CmpItemKindInterface' },
		Function = { icon = icons.kind.Function, hl = 'CmpItemKindFunction' },
		Variable = { icon = icons.kind.Variable, hl = 'CmpItemKindVariable' },
		Constant = { icon = icons.kind.Constant, hl = 'CmpItemKindConstant' },
		String = { icon = icons.kind.String, hl = 'TSString' },
		Number = { icon = icons.kind.Number, hl = 'TSNumber' },
		Boolean = { icon = icons.kind.Boolean, hl = 'TSBoolean' },
		Array = { icon = icons.kind.Array, hl = 'TSKeyword' },
		Object = { icon = icons.kind.Object, hl = 'TSKeyword' },
		Key = { icon = icons.kind.Keyword, hl = 'CmpItemKeyword' },
		Null = { icon = 'NULL', hl = 'TSKeyword' },
		EnumMember = { icon = icons.kind.EnumMember, hl = 'CmpItemKindEnumMember' },
		Struct = { icon = icons.kind.Struct, hl = 'CmpItemKindStruct' },
		Event = { icon = icons.kind.Event, hl = 'CmpItemKindEvent' },
		Operator = { icon = icons.kind.Operator, hl = 'CmpItemKindOperator' },
		TypeParameter = { icon = icons.kind.TypeParameter, hl = 'CmpItemKindTypeParameter' },
	},
}

symbols_outline.setup(opts)
