" Don't try to be vi compatible, be iMproved, required
set nocompatible

" Helps force plugins to load correctly when it is turned back on below 
filetype off " required


"****PLUGINS****

" begin vim-plug manager
call plug#begin('~/.vim/plugged')

" plugins
Plug 'christoomey/vim-tmux-navigator' "tmux-vim pane navigator
Plug 'mattn/emmet-vim' "html config
"--Emmet Config
"redefine trigger key
let g:user_emmet_leader_key=','
Plug 'tpope/vim-commentary' "vim commenting plugin

" ethan's default plugins and configs
Plug 'mbbill/undotree' " keep undo through saves
Plug 'jiangmiao/auto-pairs' " auto complete parens and such
Plug 'kana/vim-textobj-user' " allow other textob
Plug 'kana/vim-textobj-function'  " use functions as text objects
Plug 'mhinz/vim-startify' " a smarter start screen
Plug 'tpope/vim-repeat' " plugins also repeatable with . operator
Plug 'unblevable/quick-scope' " show hints when using F and T to navigate
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
Plug 'vim-airline/vim-airline' " much nicer display bar at bottom
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" Initialize plugin system
call plug#end()




"****BASIC CONFIG****

" Turn on syntax highlighting
syntax on

" Shows matching brackets
set showmatch

" Autotabs for certain code
set smarttab

" Set tabstop and shiftwidth
set tabstop=4
set shiftwidth=4

" Always show current position
set ruler 

" Show line numbers
set number

" Show status bar
set laststatus=2

" Colors
set background=dark   
set t_Co=256



"****REMAPS****

" King of all remaps
ino jk <esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright
