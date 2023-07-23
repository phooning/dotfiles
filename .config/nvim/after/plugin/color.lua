local o = vim.o

-- Colors
o.termguicolors = true
o.background = "dark"
local odp = require('onedarkpro')
odp.setup({
  dark_theme = "onedark_dark"
})
odp.load()
