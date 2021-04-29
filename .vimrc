"****PLUGINS****
" begin vim-plug manager
call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig' "native nvim lsp
Plug 'hrsh7th/nvim-compe' "nvim autocomplete
Plug 'windwp/nvim-autopairs' "nvim autopairing
Plug 'tpope/vim-commentary' "vim commenting plugin
Plug 'sainnhe/everforest' "colorscheme plugin
Plug 'vim-airline/vim-airline' " much nicer display bar at bottom
Plug 'mhinz/vim-startify' " a smarter start screen
Plug 'unblevable/quick-scope' " show hints when using F and T to navigate
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Initialize plugin system
call plug#end()


"****BASIC CONFIG****
set encoding=UTF-8
set showmatch " Shows matching brackets
set smarttab " Autotabs for certain code
set tabstop=2 " Set tabstop 
set shiftwidth=2 " Set shiftwidth 
set ruler " Always show current position
set number " Show line numbers
set laststatus=2 " Show status bar
set hlsearch " Search Highlighting

" Press Space to turn off highlighting and clear any message already displayed.
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>
set incsearch " Highlighting while typing

" turn hybrid line numbers on 
:set number relativenumber
:set nu rnu

set splitbelow
set splitright


"****REMAPS****
let mapleader = " " "map leader to space 

" King of all remaps
ino jk <esc>

" movement between vim panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>


"*****SETTINGS*****

" quick-scope settings  
augroup qs_colors
  autocmd!
  autocmd ColorScheme * highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
  autocmd ColorScheme * highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline
augroup END
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" Color settings
if has('termguicolors') " Important!!
  set termguicolors
endif
" The configuration options should be placed before `colorscheme forest-night`.
let g:everforest_disable_italic_comment = 1
let g:everforest_better_performance = 1
let g:everforest_diagnostic_virtual_text = 'colored'
colorscheme everforest 

" Neovim plugin configs
lua <<EOF
require'lspconfig'.tsserver.setup{
	on_attach = on_attach_common
}
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
}
require'nvim-autopairs'.setup{}
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

" Find files using Telescope command-line sugar.
nmap <C-P> :Telescope find_files theme=get_dropdown<CR>
nmap <C-F> :Telescope buffers theme=get_dropdown<CR>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fd <cmd>Telescope git_files<cr>
