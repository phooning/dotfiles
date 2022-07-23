set nocompatible
filetype plugin indent on

set number
syntax enable
set noswapfile
set nowrap
set ai
set ruler
set hidden
set autoindent
set updatetime=50
set scrolloff=0
set softtabstop=2
set tabstop=2 shiftwidth=2 expandtab
set autoread
set lazyredraw
set ttyfast
set bs=2
set encoding=utf-8
set hlsearch
set incsearch
set ignorecase
set smartcase

let mapleader=' '

nnoremap <silent><C-n> :bnext<CR>
nnoremap <silent><C-p> :bprevious<CR>
nnoremap <silent><C-s> :bd<CR>
nnoremap <silent><C-m> :ls<CR>
nnoremap <silent><C-t> :tabnew<CR>
nnoremap <silent><S-j> :tabprevious<CR>
nnoremap <silent><S-k> :tabnext<CR>
nnoremap <silent><C-w> :tabclose<CR>
nnoremap <silent><C-h> <C-w>h<CR>
nnoremap <silent><C-j> <C-w>j<CR>
nnoremap <silent><C-k> <C-w>k<CR>
nnoremap <silent><C-l> <C-w>l<CR>
nnoremap <silent><Leader>sh <C-w><C-s><CR>
nnoremap <silent><Leader>sv <C-w><C-v><CR>
nnoremap <silent><Leader>sq <C-w>q<CR>

call plug#begin()
Plug 'sheerun/vim-polyglot'
call plug#end()

highlight Comment ctermfg=green
