local options = {
  backup = false,
  clipboard = 'unnamedplus',
  cmdheight = 1,
  completeopt = { 'menuone', 'noselect' },
  conceallevel = 0,
  fileencoding = 'utf-8',
  hlsearch = true,
  ignorecase = true,
  mouse = 'a',
  pumheight = 10,
  showmode = false,
  showtabline = 0,
  smartcase = true,
  smartindent = true,
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,
  timeoutlen = 500,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,
  shiftwidth = 2,
  tabstop = 2,
  cursorline = true,
  number = true,
  relativenumber = true,
  laststatus = 3,
  showcmd = false,
  ruler = false,
  numberwidth = 4,
  signcolumn = 'yes',
  wrap = false,
  scrolloff = 5,
  sidescrolloff = 5,
  guifont = 'JetBrainsMono Nerd Font:h13',
  linebreak = true,
}

vim.opt.fillchars.eob = ' '
vim.opt.shortmess:append 'c'
vim.opt.whichwrap:append('<,>,[,],h,l')
vim.opt.iskeyword:append('-')
vim.opt.formatoptions:remove({ 'c', 'r', 'o' })

for k, v in pairs(options) do
  vim.opt[k] = v
end
