local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local opt = vim.opt

-- default options
opt.completeopt = {'menu', 'menuone', 'noselect'}
opt.mouse = 'a'
opt.splitright = true
opt.splitbelow = true
opt.expandtab = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.number = true
opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
-- set diffopt+=vertical " starts diff mode in vertical split
opt.hidden = true
opt.cmdheight = 1
-- set shortmess+=c " don't need to press enter so often
opt.signcolumn = 'yes'
opt.updatetime = 520
opt.undofile = true
cmd('filetype plugin on')
opt.backup = false
g.netrw_banner = false
g.netrw_liststyle = 3
g.markdown_fenced_languages = {'javascript', 'js=javascript', 'json=javascript'}
