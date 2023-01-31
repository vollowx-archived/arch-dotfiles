local status_ok, alpha = pcall(require, 'alpha')
if not status_ok then
  return
end

local dashboard = require 'alpha.themes.dashboard'

local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

local options = {
  header = {
    type = 'text',
    val = {
      '   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣿⣶⣿⣦⣼⣆          ',
      '    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ',
      '          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷    ⠻⠿⢿⣿⣧⣄     ',
      '           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ',
      '          ⢠⣿⣿⣿⠈    ⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ',
      '   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘  ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ',
      '  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ',
      ' ⣠⣿⠿⠛ ⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ',
      ' ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇ ⠛⠻⢷⣄ ',
      '      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ',
      '       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ',
    },
    opts = {
      position = 'center',
      hl = 'AlphaHeader',
    },
  },

  buttons = {
    type = 'group',
    val = {
      dashboard.button('e', ' ' .. ' New file', ':ene <BAR> startinsert <CR>'),
      dashboard.button('f', ' ' .. ' Find file', ':Telescope find_files <CR>'),
      dashboard.button('p', ' ' .. ' Find project', ':lua require("telescope").extensions.projects.projects()<CR>'),
      dashboard.button('r', ' ' .. ' Recent files', ':Telescope oldfiles <CR>'),
      dashboard.button('c', ' ' .. ' Config', ':e ~/.config/nvim/init.lua <CR>'),
      dashboard.button('q', ' ' .. ' Quit', ':qa<CR>'),
    },
    opts = {
      spacing = 1,
    },
  },

  headerPaddingTop = { type = 'padding', val = headerPadding },
  headerPaddingBottom = { type = 'padding', val = 2 },
}

alpha.setup {
  layout = {
    options.headerPaddingTop,
    options.header,
    options.headerPaddingBottom,
    options.buttons,
  },
  opts = {},
}
