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
   }

local function plugins(use)
    use {
        "wbthomason/packer.nvim",
        opt = true
    }
    use({
        "nathom/filetype.nvim",
        config = function()
          require("config.filetype")
        end,
    })

    use({ "stevearc/dressing.nvim", event = "BufReadPre" })
    use({
        "rcarriga/nvim-notify",
        event = "VimEnter",
        config = function()
          vim.notify = require("notify")
        end,
      })

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


    use({ "kazhala/close-buffers.nvim", cmd = "BDelete" })

    use({
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        opt = true,
        config = function()
            require("config.compe")
        end,
        wants = {"LuaSnip"},
        requires = {"hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "saadparwaiz1/cmp_luasnip", {
            "L3MON4D3/LuaSnip",
            wants = "friendly-snippets",
            config = function()
                require("config.snippets")
            end
        }, "rafamadriz/friendly-snippets", {
            "windwp/nvim-autopairs",
            config = function()
                require("config.autopairs")
            end
        }}
    })

    use({
        "simrat39/symbols-outline.nvim",
        cmd = {"SymbolsOutline"}
    })

    use({
        "b3nj5m1n/kommentary",
        opt = true,
        wants = "nvim-ts-context-commentstring",
        keys = {"gc", "gcc"},
        config = function()
            require("config.comments")
        end,
        requires = "JoosepAlviste/nvim-ts-context-commentstring"
    })

    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
        opt = true,
        event = "BufRead",
        requires = {{
            "nvim-treesitter/playground",
            cmd = "TSHighlightCapturesUnderCursor"
        }, "nvim-treesitter/nvim-treesitter-textobjects", "RRethy/nvim-treesitter-textsubjects"},
        config = [[require('config.treesitter')]]
    })


    use {
      "eddyekofo94/gruvbox-flat.nvim",
      config = function()
          require("config.gruvbox")
      end
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

    use({
        "mhartington/formatter.nvim",
        config = function()
            require("config.formatter")
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
                use_diagnostic_signs = true -- en
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

    use({"tweekmonster/startuptime.vim",cmd = "StartupTime"})

    use({"mbbill/undotree", cmd = "UndotreeToggle"})

    use({"mjlbach/babelfish.nvim",module = "babelfish"})

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
    use({
      "christoomey/vim-tmux-navigator",
       config = function()
          vim.g.tmux_navigator_no_mappings = 1
       end
    })

    use({
      "Pocco81/AutoSave.nvim",
      config = function()
        require('config.autosave')
      end
    })
end

return packer.setup(config, plugins)
