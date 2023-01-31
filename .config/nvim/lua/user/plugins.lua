local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
  git = {
    clone_timeout = 300,
  },
}

return packer.startup(function(use)
  -- self
  use 'wbthomason/packer.nvim'

  -- dependencies
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'

  -- plugins
  use 'goolord/alpha-nvim'
  use 'akinsho/bufferline.nvim'
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- for Comment.nvim
  use 'j-hui/fidget.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'lewis6991/impatient.nvim'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'windwp/nvim-autopairs'
  use 'rcarriga/nvim-notify'
  use 'kyazdani42/nvim-tree.lua'
  use 'nvim-treesitter/nvim-treesitter'
  use 'simrat39/symbols-outline.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'akinsho/toggleterm.nvim'
  use 'folke/trouble.nvim'
  use 'ahmedkhalf/project.nvim' -- for telescope.nvim
  use 'folke/which-key.nvim'

  -- colorschemes
  use { 'catppuccin/nvim', as = 'catppuccin' }
  use 'navarasu/onedark.nvim'
  use 'folke/tokyonight.nvim'

  -- cmp
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- buffer completions
  use 'hrsh7th/cmp-path' -- path completions
  use 'saadparwaiz1/cmp_luasnip' -- snippet completions
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-nvim-lua'

  -- snippets
  use 'L3MON4D3/LuaSnip' --snippet engine
  use 'rafamadriz/friendly-snippets' -- a bunch of snippets to use

  -- LSP
  use 'neovim/nvim-lspconfig' -- enable LSP
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'jose-elias-alvarez/null-ls.nvim' -- for formatters and linters
  use 'RRethy/vim-illuminate'

  -- Automatically set up your configuration after cloning packer.nvim
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

