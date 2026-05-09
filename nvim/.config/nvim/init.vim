set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'hashivim/vim-terraform'
Plug 'ziglang/zig.vim'
Plug 'preservim/nerdcommenter'
Plug 'LnL7/vim-nix'
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }
call plug#end()

filetype plugin indent on

if has('syntax')
    syntax on
endif

set autoindent
set expandtab
set sw=4
set tabstop=4
set expandtab
set ruler
set smarttab
set incsearch

:imap jj <Esc>

:set mouse=n

let mapleader ="'"
