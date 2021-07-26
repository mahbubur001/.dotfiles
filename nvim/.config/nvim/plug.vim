if has("nvim")
  let g:plug_home = stdpath('data') . '/plugged'
endif

call plug#begin()
" ----------------- LSP -------------
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'nvim-lua/diagnostic-nvim'

"Telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim', { 'do': 'make' }

" Better Syntax Highlighting using Tree-Sitter
Plug 'nvim-treesitter/nvim-treesitter'


Plug 'neovim/nvim-lspconfig'
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' }
Plug 'ray-x/navigator.lua'

" File manager
Plug 'kyazdani42/nvim-tree.lua'

Plug 'tpope/vim-fugitive'       " GitHub
Plug 'tpope/vim-commentary'     " Commentary
Plug 'ryanoasis/vim-devicons'   " Icon
Plug 'kyazdani42/nvim-web-devicons' " Icons
Plug 'honza/vim-snippets'       " Snippets
Plug 'mhinz/vim-startify'       " Startify


Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jiangmiao/auto-pairs' " Auto pairs and surround for '(' '[' '{' etc.
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' } " Formatter plugin

"----------------- THEME -------------
Plug 'gruvbox-community/gruvbox'
Plug 'romgrk/barbar.nvim' "Tabline
Plug 'hoob3rt/lualine.nvim'

call plug#end()
" Automatically install missing plugins on startup
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
