" Turn off compatibility mode
set nocompatible

" Enable file type detection, indenting and plugins
filetype on
filetype plugin on
filetype indent on

" Turn on syntax highlighting
syntax on

" Install vim-plug plugin manager
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/dotfiles/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Install plugins for vim
call plug#begin()

Plug 'joshdick/onedark.vim'

call plug#end()

" Use onedark colour scheme
color onedark