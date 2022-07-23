local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd

-- Globals
o.swapfile = false
o.updatetime = 300
o.dir = '/tmp'
o.hidden = true
-- Yank to
o.clipboard = "unnamedplus"
-- <SPC> as leader key
vim.g.mapleader = " "
-- Insert mode as block cursor
o.guicursor = "i:block"
-- Colors
o.termguicolors = true
o.background = "dark"
-- Wrap
o.wrap = false
-- Search
o.ignorecase = true
o.smartcase = true
o.hlsearch = true
-- Indent
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.tabstop = 2
o.smarttab = true
o.backspace = '2'
cmd('filetype plugin indent on')
-- GUI
o.number = true
o.ruler = true
wo.signcolumn = 'yes'
o.completeopt = 'menuone,noselect'
o.shell='/bin/bash'

local opts = { noremap = true, silent = true }
local set_key = vim.api.nvim_set_keymap

-- Buffer management
set_key('n', '<C-n>', ':bnext<CR>', opts)
set_key('n', '<C-p>', ':bprevious<CR>', opts)
set_key('n', '<C-s>', ':bd<CR>', opts)
set_key('n', '<C-m>', ':ls<CR>', opts)

-- Tab management
set_key('n', '<C-t>', ':tabnew<CR>', opts)
set_key('n', '<S-j>', ':tabprevious<CR>', opts)
set_key('n', '<S-k>', ':tabnext<CR>', opts)

-- Window management
set_key('n', '<C-h>', '<C-w>h<CR>', opts)
set_key('n', '<C-j>', '<C-w>j<CR>', opts)
set_key('n', '<C-k>', '<C-w>k<CR>', opts)
set_key('n', '<C-l>', '<C-w>l<CR>', opts)
-- Split window
set_key('n', '<Leader>sh', '<C-w><C-s><CR>', opts)
set_key('n', '<Leader>sv', '<C-w><C-v><CR>', opts)
-- Tree management
set_key('n', '<C-b>', ':NvimTreeToggle<CR>', opts)

-- Theme
vim.o.background = "dark"
local odp = require('onedarkpro')
odp.setup({
  dark_theme = "onedark_dark"
})
odp.load()
