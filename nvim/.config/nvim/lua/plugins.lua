local packer = require("util.packer")
local config = {
    profile = {
        enable = true,
        threshold = 0 -- the amount in ms that a plugins load time must be over for it to be included in the profile
    },
    display = {
        open_fn = function()
            return require("packer.util").float({
                border = "single"
            })
        end
    }
    -- list of plugins that should be taken from ~/projects
    -- this is NOT packer functionality!
    -- local_plugins = {
    --     -- folke = true,
    --     ["null-ls.nvim"] = false,
    --     ["nvim-lspconfig"] = false
    --     -- ["nvim-treesitter"] = true,
    -- }
}

local function plugins(use)
    -- Packer can manage itself as an optional plugin
    use {
        "wbthomason/packer.nvim",
        opt = true
    }
    use "nathom/filetype.nvim"
    use "folke/lua-dev.nvim"

    -- LSP
    use {
        "neovim/nvim-lspconfig",
        opt = true,
        event = "BufReadPre",
        wants = {"nvim-lsp-ts-utils", "null-ls.nvim", "lua-dev.nvim", "cmp-nvim-lsp", "nvim-lsp-installer"},
        config = function()
            require("config.lsp")
        end,
        requires = {"jose-elias-alvarez/nvim-lsp-ts-utils", "jose-elias-alvarez/null-ls.nvim", "folke/lua-dev.nvim",
                    "williamboman/nvim-lsp-installer"}
    }

    -- Theme: color schemes
    use {
        "ellisonleao/gruvbox.nvim",
        config = function()
            require("config.gruvbox")
        end,
        requires = {"rktjmp/lush.nvim"}
    }
    -- Theme: icons
    use {
        "kyazdani42/nvim-web-devicons",
        module = "nvim-web-devicons",
        config = function()
            require("nvim-web-devicons").setup({
                default = true
            })
        end
    }
    -- Dashboard
    use({
        "glepnir/dashboard-nvim",
        config = [[require('config.dashboard')]]
    })

    use({
        "nvim-lua/plenary.nvim",
        module = "plenary"
    })
    use({
        "nvim-lua/popup.nvim",
        module = "popup"
    })
    use({
        "windwp/nvim-spectre",
        opt = true,
        module = "spectre",
        wants = {"plenary.nvim", "popup.nvim"},
        requires = {"nvim-lua/popup.nvim", "nvim-lua/plenary.nvim"}
    })

    use({
        "kyazdani42/nvim-tree.lua",
        cmd = {"NvimTreeToggle", "NvimTreeClose"},
        config = function()
            require("config.tree")
        end
    })

    -- Fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        opt = true,
        config = function()
            require("config.telescope")
        end,
        cmd = {"Telescope"},
        module = "telescope",
        keys = {"<leader><space>", "<leader>fz", "<leader>pp"},
        wants = {"plenary.nvim", "popup.nvim", "telescope-z.nvim", -- "telescope-frecency.nvim",
        "telescope-fzy-native.nvim", "telescope-project.nvim", "trouble.nvim", "telescope-symbols.nvim"},
        requires = {"nvim-telescope/telescope-z.nvim", "nvim-telescope/telescope-project.nvim", "nvim-lua/popup.nvim",
                    "nvim-lua/plenary.nvim", "nvim-telescope/telescope-symbols.nvim",
                    "nvim-telescope/telescope-fzy-native.nvim" -- { "nvim-telescope/telescope-frecency.nvim", requires = "tami5/sql.nvim" }
        }
    })

    -- Indent Guides and rainbow brackets
    use({
        "lukas-reineke/indent-blankline.nvim",
        event = "BufReadPre",
        config = function()
            require("config.blankline")
        end
    })
    -- Tabs
    use({
        "akinsho/nvim-bufferline.lua",
        event = "BufReadPre",
        wants = "nvim-web-devicons",
        config = function()
            require("config.bufferline")
        end
    })

    -- Terminal
    use({
        "akinsho/nvim-toggleterm.lua",
        keys = "<M-`>",
        config = function()
            require("config.toggleterm")
        end
    })

    -- Smooth Scrolling
    use({
        "karb94/neoscroll.nvim",
        keys = {"<C-u>", "<C-d>", "gg", "G"},
        config = function()
            require("config.scroll")
        end
    })
    use({
        "edluffy/specs.nvim",
        after = "neoscroll.nvim",
        config = function()
            require("config.specs")
        end
    })

    -- Git Gutter
    use({
        "lewis6991/gitsigns.nvim",
        event = "BufReadPre",
        wants = "plenary.nvim",
        requires = {"nvim-lua/plenary.nvim"},
        config = function()
            require("config.gitsigns")
        end
    })
    use({
        "TimUntersberger/neogit",
        cmd = "Neogit",
        config = function()
            require("config.neogit")
        end
    })

    -- Statusline
    use({
        "nvim-lualine/lualine.nvim",
        event = "VimEnter",
        config = [[require('config.lualine')]],
        wants = "nvim-web-devicons"
    })

    use({
        "norcalli/nvim-colorizer.lua",
        event = "BufReadPre",
        config = function()
            require("config.colorizer")
        end
    })

    use({
        "npxbr/glow.nvim",
        cmd = "Glow"
    })

    use({
        "plasticboy/vim-markdown",
        opt = true,
        requires = "godlygeek/tabular",
        ft = "markdown"
    })
    use({
        "iamcco/markdown-preview.nvim",
        run = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = "markdown",
        cmd = {"MarkdownPreview"}
    })

    use({
        "phaazon/hop.nvim",
        keys = {"gh"},
        cmd = {"HopWord", "HopChar1"},
        config = function()
            require("util").nmap("gh", "<cmd>HopWord<CR>")
            -- require("util").nmap("s", "<cmd>HopChar1<CR>")
            -- you can configure Hop the way you like here; see :h hop-config
            require("hop").setup({})
        end
    })

    use({
        "ggandor/lightspeed.nvim",
        event = "BufReadPost",
        config = function()
            require("config.lightspeed")
        end
    })

    use({
        "folke/trouble.nvim",
        event = "BufReadPre",
        wants = "nvim-web-devicons",
        cmd = {"TroubleToggle", "Trouble"},
        config = function()
            require("trouble").setup({
                auto_open = false,
                use_lsp_diagnostic_signs = true -- en
            })
        end
    })

    use({
        "folke/persistence.nvim",
        event = "BufReadPre",
        module = "persistence",
        config = function()
            require("persistence").setup()
        end
    })

    use({
        "tweekmonster/startuptime.vim",
        cmd = "StartupTime"
    })

    use({
        "mbbill/undotree",
        cmd = "UndotreeToggle"
    })

    use({
        "mjlbach/babelfish.nvim",
        module = "babelfish"
    })

    use({
        "folke/zen-mode.nvim",
        cmd = "ZenMode",
        opt = true,
        wants = "twilight.nvim",
        requires = {"folke/twilight.nvim"},
        config = function()
            require("zen-mode").setup({
                plugins = {
                    gitsigns = true,
                    tmux = true,
                    kitty = {
                        enabled = false,
                        font = "+2"
                    }
                }
            })
        end
    })

    use({
        "folke/todo-comments.nvim",
        cmd = {"TodoTrouble", "TodoTelescope"},
        event = "BufReadPost",
        config = function()
            require("config.todo")
        end
    })

    use({
        "folke/which-key.nvim",
        event = "VimEnter",
        config = function()
            require("config.keys")
        end
    })

    use({
        "sindrets/diffview.nvim",
        cmd = {"DiffviewOpen", "DiffviewClose", "DiffviewToggleFiles", "DiffviewFocusFiles"},
        config = function()
            require("config.diffview")
        end
    })

    use({
        "RRethy/vim-illuminate",
        event = "CursorHold",
        module = "illuminate",
        config = function()
            vim.g.Illuminate_delay = 1000
        end
    })

    use("nanotee/luv-vimdocs")
    use({
        "andymass/vim-matchup",
        event = "CursorMoved"
    })
    use({
        "camspiers/snap",
        rocks = {"fzy"},
        module = "snap"
    })
    use("kmonad/kmonad-vim")

end

return packer.setup(config, plugins)
