" Filename:   init.vim
" Github:     https://github.com/ghidalgo93/dotfiles
" Maintainer: Gerardo Hidalgo-Cuellar 

" Plugins {{{


call plug#begin('~/.config/nvim/plugged') " begin vim-plug manager

Plug 'hrsh7th/nvim-compe' "nvim autocomplete
Plug 'windwp/nvim-autopairs' "nvim autopairing
Plug 'tpope/vim-commentary' "vim commenting plugin
Plug 'sainnhe/everforest' "colorscheme plugin
Plug 'vim-airline/vim-airline' " much nicer display bar at bottom
Plug 'mhinz/vim-startify' " a smarter start screen
Plug 'unblevable/quick-scope' " show hints when using F and T to navigate
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']} " markdown preview
Plug 'kyazdani42/nvim-web-devicons' " file tree with file icons
Plug 'kyazdani42/nvim-tree.lua' " actual file tree
Plug 'tpope/vim-fugitive'

" neovim lsp plugins
Plug 'neovim/nvim-lspconfig' "native nvim lsp

" neovim tree sitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" neovim telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

call plug#end() " Initialize plugin system

" Neovim plugin configs
lua <<EOF
require'lspconfig'.tsserver.setup{
	on_attach = on_attach_common
}
require'lspconfig'.eslint.setup{}
require'lspconfig'.pyright.setup{}
require('nvim-autopairs').setup{}
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}
require'compe'.setup({
		enabled = true,
    source = {
      path = true,
      buffer = true,
      nvim_lsp = true,
    },
  })
require('telescope').setup{
  defaults = {
    vimgrep_arguments = {
      'rg',
      '--color=never',
      '--no-heading',
      '--with-filename',
      '--line-number',
      '--column',
      '--smart-case', 
			'--hidden'
    }
  }
}
EOF

" quick-scope settings  
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" nvim tree
nnoremap <leader>tt :NvimTreeToggle<CR>
" }}}

" Colors {{{
syntax enable

" Color settings
if has('termguicolors') " Important!!
	set termguicolors
endif

" The configuration options should be placed before `colorscheme forest-night`.
let g:everforest_disable_italic_comment = 1
let g:everforest_better_performance = 1
let g:everforest_diagnostic_virtual_text = 'colored'
colorscheme everforest 
" }}}

" Tabs and Spaces {{{
set smarttab 		" Autotabs for certain code
set tabstop=2 	" Set tabstop 
set shiftwidth=2 " Set shiftwidth 
" }}}

" UI {{{
let mapleader = " " 	" Map leader to space 
ino jk <esc> 					" King of all remaps
tnoremap jk <C-\><C-n> " terminal remap escape
set cursorline 				" Hightlight cursorline
set showmatch 				" Shows matching brackets
set number 						"show lines 
set relativenumber 		"set relative numbers
set laststatus=2 			" Show status bar
set ruler 						" Always show current position
set hlsearch 					" Search Highlighting
set incsearch 				" Highlighting while typing
nnoremap <silent> <space> :nohlsearch<Bar>:echo<CR> 			" Return to turn off highlighting

" movement between vim panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Splits
set splitbelow
set splitright

" Encoding? 
set encoding=UTF-8

" Open vim terminal
nnoremap <leader>tm :vsp <bar> :term<CR> 
" }}}

" Section Folding {{{
set foldenable
set foldlevelstart=10 
set foldnestmax=10
set foldmethod=syntax
nnoremap <CR> za "Open and close folds
" }}}

" Telescope {{{
" Find files using Telescope command-line sugar.
nmap <C-P> :Telescope find_files theme=get_dropdown<CR>
nmap <C-F> :Telescope buffers theme=get_dropdown<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope git_files<cr>
" }}}

" VIMRC {{{
nnoremap <leader>ev :topleft vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC <bar> :doautocmd BufRead<CR>
" }}}

" vim:foldmethod=marker:foldlevel=0
