packer = require 'packer'
packer.startup(function(use)
    use {
        'wbthomason/packer.nvim',
        opt = false
    }
    ----------------- LSP -------------
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'
    use 'hrsh7th/nvim-compe'
    use 'nvim-lua/lsp-status.nvim'
    use 'nvim-lua/diagnostic-nvim'

    -- Telescope
    use 'nvim-lua/popup.nvim'
    use 'nvim-lua/plenary.nvim'
    use 'nvim-telescope/telescope.nvim'
    use 'nvim-telescope/telescope-github.nvim'
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }

    use "nvim-telescope/telescope-hop.nvim"

    -- Better Syntax Highlighting using Tree-Sitter
    use 'nvim-treesitter/nvim-treesitter'

    use {
        'kyazdani42/nvim-tree.lua',
        config = function()
            require'nvim-tree'.setup {}
        end
    }

    use 'hrsh7th/vim-vsnip'
    use 'hrsh7th/vim-vsnip-integ'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-vsnip'

    use {
        'ray-x/guihua.lua',
        run = 'cd lua/fzy && make'
    }
    use 'ray-x/navigator.lua'

    use 'tpope/vim-fugitive' -- GitHub
    use 'tpope/vim-commentary' -- Commentary
    use 'ryanoasis/vim-devicons' -- Icon
    use 'kyazdani42/nvim-web-devicons' -- Icons
    use 'honza/vim-snippets' -- Snippets

    use 'mg979/vim-visual-multi'
    use 'jiangmiao/auto-pairs' -- Auto pairs and surround for '(' '[' '{' etc.
    use 'tpope/vim-surround'
    use {
        'prettier/vim-prettier',
        run = 'yarn install'
    } -- Formatter plugin

    --- ----------------- THEME -------------
    use 'gruvbox-community/gruvbox'
    use 'romgrk/barbar.nvim' -- Tabline
    use 'hoob3rt/lualine.nvim'
end)
