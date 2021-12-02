local o = vim.o
local wo = vim.wo
local bo = vim.bo
local cmd = vim.cmd

-- globals
o.swapfile = true
o.updatetime = 300
o.dir = '/tmp'
o.hidden = true
-- yank into clipboard
o.clipboard = "unnamedplus"
-- <SPC> as leader key
vim.g.mapleader = " "
-- insert mode block cursor
o.guicursor = "i:block"

-- colors
o.termguicolors = true
o.background = "dark"
-- vim.cmd('colorscheme blue')
-- vim.g.tokyonight_style = "night"
vim.g.tokyonight_italic_functions = true
vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
vim.g.tokyonight_colors = {
  -- bg = "#000000"

  -- Blue
  -- fg_gutter = "#00ffff",
  -- bg = "#000087",
  -- bg_sidebar = "#000050",
  -- bg_statusline = "#000050",

  -- Terminal.app
  fg_gutter = "#cf8943",
  bg = "#1e1e1e",
  comment = "#ff0000",
  green = "#00ff00",
  fg = "#ffffff"
}
vim.cmd[[colorscheme tokyonight]]

-- wrapping
o.wrap = false

-- search
o.ignorecase = true
o.smartcase = true
o.hlsearch = true

-- indent
o.softtabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.autoindent = true
o.tabstop = 2
o.smarttab = true
o.backspace = '2'
cmd('filetype plugin indent on')

-- gui
o.number = true
o.ruler = true
wo.signcolumn = 'yes'
o.completeopt = 'menuone,noselect'

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
set_key('n', '<C-h>', '<C-w>h', opts)
set_key('n', '<C-j>', '<C-w>j', opts)
set_key('n', '<C-k>', '<C-w>k', opts)
set_key('n', '<C-l>', '<C-w>l', opts)
-- Split window
set_key('n', '<Leader>sh', '<C-w><C-s>', opts)
set_key('n', '<Leader>sv', '<C-w><C-v>', opts)

-- Search files
set_key('n', '<Leader>pf', "<cmd>lua require('telescope.builtin').find_files()<CR>", opts)
-- Grep
set_key('n', '<Leader>ps', "<cmd>lua require('telescope.builtin').live_grep()<CR>", opts)
-- Search buffers
set_key('n', '<Leader>pb', "<cmd>lua require('telescope.builtin').buffers()<CR>", opts)
-- Search tags
set_key('n', '<Leader>ph', "<cmd>lua require('telescope.builtin').help_tags()<CR>", opts)
-- Manage files
set_key('n', '<Leader>pe', "<cmd>lua require('telescope.builtin').file_browser()<CR>", opts)
-- Definitions
set_key('n', 'gd', "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
-- References
set_key('n', 'gr', "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
-- Workspace errors/warnings
set_key('n', 'gw', "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", opts)
-- Previously opened files
set_key('n', 'gp', "<cmd>lua require('telescope.builtin').oldfiles()<CR>", opts)
-- Previously run commands
set_key('n', 'gch', "<cmd>lua require('telescope.builtin').command_history()<CR>", opts)
-- Previously searched
set_key('n', 'gsh', "<cmd>lua require('telescope.builtin').search_history()<CR>", opts)

-- Rust: rustfmt
set_key('n', '<Leader>f', "<cmd>lua vim.lsp.buf.formatting()<CR>",  opts)

-- LSP diagnostics
set_key('n', "<Leader>dx", "<cmd>Trouble<cr>", opts)
set_key('n', "<Leader>dw", "<cmd>Trouble lsp_workspace_diagnostics<cr>", opts)
set_key('n', "<Leader>dd", "<cmd>Trouble lsp_document_diagnostics<cr>", opts)
set_key('n', "<Leader>dl", "<cmd>Trouble loclist<cr>", opts)
set_key('n', "<Leader>dq", "<cmd>Trouble quickfix<cr>", opts)
set_key('n', "gR", "<cmd>Trouble lsp_references<cr>", opts)

-- LSP keybindings
local nvim_lsp = require('lspconfig')
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  -- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  -- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  -- buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  -- buf_set_keymap('n', '<Leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  -- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  -- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  -- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

-- Disable inline virtual text diagnostics. Replaced with statusline
local function setup_diags()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = true,
    }
  )
end

-- Update nvim-cmp capabilities
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- Update settings
local servers = { 'rust_analyzer', 'pyright', 'tsserver' }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150
    }
  }
end

-- Setup nvim-cmp autocompletion
local cmp = require('cmp')
cmp.setup({
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = {
    { name = 'nvim_lsp' }
  }
})

-- Setup nvim-tree file browser
-- 
--     <CR> or o on .. will cd in the above directory
--     <C-]> will cd in the directory under the cursor
--     <BS> will close current opened directory or parent
--     type a to add a file. Adding a directory requires leaving a leading / at the end of the path.
--         you can add multiple directories by doing foo/bar/baz/f and it will add foo bar and baz directories and f as a file
--     type r to rename a file
--     type <C-r> to rename a file and omit the filename on input
--     type x to add/remove file/directory to cut clipboard
--     type c to add/remove file/directory to copy clipboard
--     type y will copy name to system clipboard
--     type Y will copy relative path to system clipboard
--     type gy will copy absolute path to system clipboard
--     type p to paste from clipboard. Cut clipboard has precedence over copy (will prompt for confirmation)
--     type d to delete a file (will prompt for confirmation)
--     type ]c to go to next git item
--     type [c to go to prev git item
--     type - to navigate up to the parent directory of the current file/directory
--     type s to open a file with default system application or a folder with default file manager (if you want to change the command used to do it see :h nvim-tree.setup under system_open)
--     if the file is a directory, <CR> will open the directory otherwise it will open the file in the buffer near the tree
--     if the file is a symlink, <CR> will follow the symlink (if the target is a file)
--     <C-v> will open the file in a vertical split
--     <C-x> will open the file in a horizontal split
--     <C-t> will open the file in a new tab
--     <Tab> will open the file as a preview (keeps the cursor in the tree)
--     I will toggle visibility of hidden folders / files
--     H will toggle visibility of dotfiles (files/folders starting with a .)
--     R will refresh the tree
--     Double left click acts like <CR>
--     Double right click acts like <C-]>
-- 
set_key('n', '<C-b>', ':NvimTreeToggle<CR>', opts)
set_key('n', '<Leader>r', ':NvimTreeRefresh<CR>', opts)
set_key('n', '<Leader>n', ':NvimTreeFindFile<CR>', opts)
require('nvim-tree').setup({})
require('lspconfig').texlab.setup{}

-- Zephyr theme
-- require('theme')


setup_diags()

