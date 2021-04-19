"****PLUGINS****

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

" begin vim-plug manager
call plug#begin('~/.vim/plugged')

" plugins
Plug 'dense-analysis/ale' "ALE, Asynchronous Lint Engine
let g:ale_fixers = {
\   'javascript': ['prettier', 'eslint'],
\   'css': ['prettier'],
\ 	'html': ['prettier'],
\} "global js aleFix config
let g:ale_fix_on_save = 1 
Plug 'neoclide/coc.nvim', {'branch': 'release'} "COC autocomplete
Plug 'christoomey/vim-tmux-navigator' "tmux-vim pane navigator
Plug 'mattn/emmet-vim' "html config
let g:user_emmet_leader_key=',' "redefine trigger key
Plug 'tpope/vim-commentary' "vim commenting plugin
Plug 'sheerun/vim-polyglot' "collection of language packs for vim
Plug 'sainnhe/everforest'


" ethan's default plugins and configs
Plug 'mbbill/undotree' " keep undo through saves
Plug 'jiangmiao/auto-pairs' " auto complete parens and such
Plug 'kana/vim-textobj-user' " allow other textob
Plug 'kana/vim-textobj-function'  " use functions as text objects
Plug 'mhinz/vim-startify' " a smarter start screen
Plug 'junegunn/fzf', { 'do': { -> fzf#install()  }  }
Plug 'junegunn/fzf.vim'
nmap <C-P> :Files<CR> 
Plug 'unblevable/quick-scope' " show hints when using F and T to navigate
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
Plug 'vim-airline/vim-airline' " much nicer display bar at bottom

" Initialize plugin system
call plug#end()


"****BASIC CONFIG****

" Shows matching brackets
set showmatch

" Autotabs for certain code
set smarttab

" Set tabstop and shiftwidth
set tabstop=2
set shiftwidth=2

" Always show current position
set ruler 

" Show line numbers
set number

" Show status bar
set laststatus=2

" Search Highlighting
set hlsearch

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

" Highlighting while typing
set incsearch

" turn hybrid line numbers on 
:set number relativenumber
:set nu rnu

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
	\ pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<Tab>" :
	\ coc#refresh()

set encoding=UTF-8

" Important!!
if has('termguicolors')
  set termguicolors
endif
" The configuration options should be placed before `colorscheme forest-night`.
" let g:forest_night_enable_italic = 1
" let g:forest_night_disable_italic_comment = 1
" " let g:forest_night_diagnostic_text_highlight = 1
" " let g:forest_night_diagnostic_line_highlight = 1
" let g:forest_night_better_performance = 1
colorscheme everforest 


"****REMAPS****

" King of all remaps
ino jk <esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader=","

set splitbelow
set splitright
