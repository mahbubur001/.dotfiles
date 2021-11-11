vim.g.mapleader = " "

-- Turn off builtin plugins I do not use.
require "my.disable_builtin"
require "my.plugins"

require "my.options"
local function map(mode, lhs, rhs, opts)
    local options = {
        noremap = true
    }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<C-e>', ':NvimTreeToggle<CR>', {
    silent = true
})

local lsp_installer = require("nvim-lsp-installer")
lsp_installer.on_server_ready(function(server)
    local opts = {}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/ADVANCED_README.md
    server:setup(opts)
end)
