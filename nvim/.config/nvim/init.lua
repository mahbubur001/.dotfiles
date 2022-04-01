-- insures packer is installed
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

-- include plugins and their config
require('plugins')
require('config.treesitter')
require('config.autopairs')
require("config.colour")
require("config.toggleTerm")
require("config.presence")
require("config.lualine")
require("config.colorizer")
require("config.toggle_lsp_diagnostics")
require('config.lsp_config.lsp-cmp')
require('config.lsp_config.lsp-config')
require('config.lazygit')
require('config.comment')
require('config.bufferline')
require('config.hop')
require('config.gitsigns')
require('config.autosave')
require("config.dashboard")
require("config.nvim-tree")


require("options")
require("bindings")


-- CpHelper config
-- vim.g.cphdir = '/home/anurag/problems'

-- Rooter config
--vim.g.rooter_pattern = { "input1", "output1" }
