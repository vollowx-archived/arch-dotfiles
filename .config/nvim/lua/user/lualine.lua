local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

local icons = require('user.icons')

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  sections = { 'error', 'warn' },
  symbols = {
    error = icons.diagnostics.Error .. ' ',
    warn = icons.diagnostics.Warning .. ' '
  },
  always_visible = true,
}

local diff = {
  'diff',
  colored = false,
  symbols = {
    added = icons.git.LineAdded .. ' ',
    modified = icons.git.LineModified .. ' ',
    removed = icons.git.LineRemoved .. ' '
  }, -- changes diff symbols
  cond = hide_in_width,
}

local spaces = function()
  return 'spaces: ' .. vim.api.nvim_buf_get_option(0, 'shiftwidth')
end

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = 'auto',
    component_separators = { left = icons.ui.DividerRight, right = icons.ui.DividerLeft  },
    section_separators = { left = icons.ui.BoldDividerRight, right = icons.ui.BoldDividerLeft },
    disabled_filetypes = { 'alpha', 'dashboard' },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = {'branch'},
    lualine_c = { diagnostics, 'filename' },
    lualine_x = { diff, spaces, 'encoding', 'filetype' },
    lualine_y = { 'progress' },
    lualine_z = { 'location' },
  },
}
