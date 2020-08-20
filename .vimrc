" Don't try to be vi compatible, be iMproved, required
set nocompatible

" Helps force plugins to load correctly when it is turned back on below 
filetype off " required


"****PLUGINS****

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
" Keep Plugin commands between vundle#begin/end.
call vundle#begin()

" plugins
Plugin 'VundleVim/Vundle.vim' "let Vundle manage Vundle, required
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required



"****BASIC CONFIG****

" Config for papercolor theme
set background=dark   
set t_Co=256
colorscheme PaperColor

" Turn on syntax highlighting
syntax on

" Always show current position
set ruler 

" Show line numbers
set number

" Show status bar
set laststatus=2



"****REMAPS****

" King of all remaps
ino jk <esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
