require('settings')
require('plugins')

require('nvim_comment').setup()
require('lspconfig').rust_analyzer.setup({
  settings = {
    ['rust-analyzer'] = {
      checkOnSave = {
        command = "clippy"
      }
    }
  }
})

require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true
  }
})

