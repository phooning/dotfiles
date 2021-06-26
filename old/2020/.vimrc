set autoindent
set updatetime=300
set cmdheight=2
set timeoutlen=300
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
set signcolumn=yes
set encoding=utf-8

set visualbell
set noerrorbells

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

set incsearch
set ignorecase
set smartcase
set vb t_vb= 
set backspace=2
set nofoldenable
set ttyfast
set lazyredraw
set synmaxcol=500
set laststatus=2
set number
set relativenumber
set mouse=a

call plug#begin('~/.vim/plugged')

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'chriskempson/base16-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

call plug#end()

syntax on
colorscheme base16-gruvbox-dark-hard

vnoremap <C-C> :w !xclip -i -sel c<CR><CR>
