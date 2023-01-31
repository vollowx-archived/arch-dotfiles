local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

local icons = require('user.icons')

bufferline.setup {
  options = {
    close_command = 'bd! %d',
    right_mouse_command = 'bd! %d',
    offsets = { { filetype = 'NvimTree', text = '', padding = 1 } },
    max_name_length = 30,
    max_prefix_length = 30,
    tabsize = 21,
    indicator = {
      icon = icons.ui.BoldLineLeft, -- this should be omitted if indicator style is not 'icon'
      style = 'icon', -- can also be 'underline'|'none',
    },
    separator_style = 'thin',
    always_show_bufferline = true,
    buffer_close_icon = icons.ui.Close,
    modified_icon = icons.ui.Circle,
    close_icon = icons.ui.BoldClose,
    left_trunc_marker = icons.ui.ArrowCircleLeft,
    right_trunc_marker = icons.ui.ArrowCircleRight,
    diagnostics = 'nvim_lsp',
    diagnostics_indicator = function(count, level, diagnostics_dict, context)
      local s = ' '
      for e, n in pairs(diagnostics_dict) do
        local sym = e == 'error' and icons.diagnostics.Error .. ' '
          or (e == 'warning' and icons.diagnostics.Warning .. ' ' or icons.diagnostics.Hint .. ' ')
        s = s .. n .. sym
      end
      return s
    end,
  },

  highlights = {
    fill = {
      fg = { attribute = 'fg', highlight = '#ff0000' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },

    background = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },

    buffer_visible = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },

    close_button = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    close_button_visible = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },
    tab_selected = {
      fg = { attribute = 'fg', highlight = 'Normal' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },

    tab = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },

    tab_close = {
      -- fg = {attribute='fg',highlight='LspDiagnosticsDefaultError'},
      fg = { attribute = 'fg', highlight = 'TabLineSel' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },

    duplicate_selected = {
      fg = { attribute = 'fg', highlight = 'TabLineSel' },
      bg = { attribute = 'bg', highlight = 'TabLineSel' },
      italic = true,
    },

    duplicate_visible = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
      italic = true,
    },

    duplicate = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
      italic = true,
    },

    modified = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },

    modified_selected = {
      fg = { attribute = 'fg', highlight = 'Normal' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },

    modified_visible = {
      fg = { attribute = 'fg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },

    separator = {
      fg = { attribute = 'bg', highlight = 'TabLine' },
      bg = { attribute = 'bg', highlight = 'TabLine' },
    },

    separator_selected = {
      fg = { attribute = 'bg', highlight = 'Normal' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },

    indicator_selected = {
      fg = { attribute = 'fg', highlight = 'LspDiagnosticsDefaultHint' },
      bg = { attribute = 'bg', highlight = 'Normal' },
    },
  },
}
