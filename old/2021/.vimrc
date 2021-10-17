set nocompatible
filetype plugin indent on
syntax on
set number
set hlsearch
set hidden
set nowrap
set noswapfile
set nobackup
set undofile

set ai
set ruler

set incsearch
set ignorecase
set smartcase

set tabstop=2
set softtabstop=2
set shiftwidth=2
set smarttab
set expandtab
set autoindent

set scrolloff=8

set autoread
set lazyredraw
set ttyfast
set updatetime=50

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set bs=2

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
