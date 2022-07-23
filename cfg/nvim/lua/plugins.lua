function packerfn()
  use 'wbthomason/packer.nvim'
  use 'olimorris/onedarkpro.nvim'
  use 'terrortylor/nvim-comment'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icons
    },
  }
end

return require('packer').startup({ packerfn })
