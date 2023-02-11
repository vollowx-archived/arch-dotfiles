return function()
  local alpha = require('alpha')
  local dashboard = require('alpha.themes.dashboard')

  local fn = vim.fn
  local marginTopPercent = 0.3
  local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

  function footer()
    local stats = require("lazy").stats()
    local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
    return "   Have Fun with neovim"
        .. "   v"
        .. vim.version().major
        .. "."
        .. vim.version().minor
        .. "."
        .. vim.version().patch
        .. "   "
        .. stats.count
        .. " plugins in "
        .. ms
        .. "ms"
  end

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
end
