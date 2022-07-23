require('plugins')
require('settings')
require('nvim_comment').setup()

require('nvim-treesitter.configs').setup {
  ensure_installed = { "c", "cpp", "lua", "rust", "javascript", "latex", "llvm", "lua", "python", "scss", "typescript", "json", "html", "css" },
  highlight = { 
    enable = true 
  }
}

require('nvim-tree').setup()

