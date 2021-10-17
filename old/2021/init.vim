" 21st century
set nocompatible

" Enable syntax and netrw plugins
filetype plugin indent on
syntax on

" Search into subdirs
" Tab-completion for all file tasks
set path+=**

" Display find * menu and :b autocomplete
set wildmenu

" TAG JUMPING
" ^] j to tag on cursor
" g^] ambiguous tags
" ^t jump back up tag stack
command! MakeTags !ctags -R .

" AUTOCOMPLETE - reads tag file
" ^x^n for current file
" ^x^f for filenames
" ^x^] for tags
" ^n anything

" FILE BROWSING
let g:netrw_banner=0        " Disable banner
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_localrmdir='rm -r'

" Block cursor
set guicursor=
set guicursor+=a:blinkon0

" Left number
set number

" Highlight after search
set hlsearch

" Hidden buffers
set hidden

" Wrapping
set nowrap

" History
set noswapfile
set nobackup
set undofile

set ai
set ruler

" Search defaults
set incsearch
set ignorecase
set smartcase

" Tab options
set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent

" Scroll when 8 edge
set scrolloff=8

" Column for debug
"set colorcolumn=80
set signcolumn=yes
set cmdheight=2

set autoread
set lazyredraw
set ttyfast
set updatetime=50

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bs=2

call plug#begin()
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'joshdick/onedark.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'preservim/nerdtree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
call plug#end()

lua require'lspconfig'.rust_analyzer.setup({})

" Theming
colorscheme onedark
set bg=dark
hi Comment ctermfg=green
hi Normal ctermbg=256 guibg=#303030

let mapleader=" "
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" NERDTree
nnoremap <C-i> :NERDTreeToggle<CR>

" Buffer management
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>
nnoremap <C-w> :bd<CR>
nnoremap <C-m> :ls<CR>

" Telescope
nnoremap <Leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <Leader>pg :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>pf :lua require('telescope.builtin').find_files()<CR>
nnoremap <Leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <Leader>pb :lua require('telescope.builtin').buffers()<CR>

" Splits
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Auto import
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Jump to definition has a native fallback
" C-o to go back
function! s:GoToDefinition()
  if CocAction('jumpDefinition')
    return v:true
  endif

  let ret = execute("silent! normal \<C-]>")
  if ret =~ "Error" || ret =~ "error"
    call searchdecl(expand('<cword>'))
  endif
endfunction

nmap <silent> gd :call <SID>GoToDefinition()<CR>

" CoC window scroll
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

set laststatus=2
set noshowmode
set statusline=
set statusline+=%0*\ %n\                                 " Buffer number
set statusline+=%1*\ %<%F%m%r%h%w\                       " File path, modified, readonly, helpfile, preview
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %Y\                                 " FileType
set statusline+=%3*│                                     " Separator
set statusline+=%2*\ %{''.(&fenc!=''?&fenc:&enc).''}     " Encoding
set statusline+=\ (%{&ff})                               " FileFormat (dos/unix..)
set statusline+=%=                                       " Right Side
set statusline+=%2*\ col:\ %02v\                         " Colomn number
set statusline+=%3*│                                     " Separator
set statusline+=%1*\ ln:\ %02l/%L\ (%3p%%)\              " Line number / total lines, percentage of document

