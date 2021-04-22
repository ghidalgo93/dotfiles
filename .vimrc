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
Plug 'neovim/nvim-lspconfig' "native nvim lsp
Plug 'nvim-lua/completion-nvim' "native nvim autocomplete
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
Plug 'christoomey/vim-tmux-navigator' "tmux-vim pane navigator
Plug 'tpope/vim-commentary' "vim commenting plugin
Plug 'sheerun/vim-polyglot' "collection of language packs for vim
Plug 'jiangmiao/auto-pairs' 
Plug 'sainnhe/everforest'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" ethan's default plugins and configs
Plug 'mhinz/vim-startify' " a smarter start screen
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

set encoding=UTF-8

" Important!!
if has('termguicolors')
  set termguicolors
endif
" The configuration options should be placed before `colorscheme forest-night`.
let g:everforest_disable_italic_comment = 1
let g:everforest_better_performance = 1
let g:everforest_diagnostic_virtual_text = 'colored'
colorscheme everforest 

lua require('lspconfig').tsserver.setup{on_attach=require'completion'.on_attach}

"****REMAPS****
let mapleader = "," "map leader to comma

" King of all remaps
ino jk <esc>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope git_files<cr>
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}
EOF

set splitbelow
set splitright

func! WordProcessor()
  " movement changes
  map j gj
  map k gk
  " formatting text
  setlocal formatoptions=1
  setlocal noexpandtab
  setlocal wrap
  setlocal linebreak
  " spelling and thesaurus
  setlocal spell spelllang=en_us
  set thesaurus+=/home/gerardo/dotfiles/vim/thesaurus/mthesaur.txt
  " complete+=s makes autocompletion search the thesaurus
  set complete+=s
endfu
com! WP call WordProcessor()
