return require('packer').startup(function()
  -- Packer manages itself
  use 'wbthomason/packer.nvim'
  -- vim-commentary in lua
  use 'terrortylor/nvim-comment'
  -- Searching
  use {
    'nvim-telescope/telescope.nvim',
    requires = { 
      { 'nvim-lua/plenary.nvim' },
      { 'kyazdani42/nvim-web-devicons' }
    }
  }
  use 'neovim/nvim-lspconfig'
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp'
  -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-nvim-lsp'
  -- alt: https://github.com/ms-jpq/coq_nvim
 
  -- File browser
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function() require'nvim-tree'.setup {} end
  }

  -- LSP diagnostics move to status line
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({})
    end
  }

  -- Theme
  use 'folke/tokyonight.nvim'
end)
