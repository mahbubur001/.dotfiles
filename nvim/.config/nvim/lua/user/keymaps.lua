vim.g.mapleader = ' '

local util = require("util")

vim.o.timeoutlen = 400

-- Move to window using the <ctrl> movement keys
util.nmap("<C-h>", ":TmuxNavigateLeft<cr>")
util.nmap("<C-j>", ":TmuxNavigateDown<cr>")
util.nmap("<C-k>", ":TmuxNavigateUp<cr>")
util.nmap("<C-l>", ":TmuxNavigateRight<cr>")
-- Resize window using <ctrl> arrow keys
util.nnoremap("<C-S-Up>", ":resize +2<CR>")
util.nnoremap("<C-S-Down>", ":resize -2<CR>")
util.nnoremap("<C-S-Left>", ":vertical resize -2<CR>")
util.nnoremap("<C-S-Right>", ":vertical resize +2<CR>")

-- Switch buffers with tab
util.nnoremap("<S-H>", ":bprevious <cr>")
util.nnoremap("<S-l>", ":bnext<cr>")

-- Insert
util.inoremap("jk", "<ESC>");
util.inoremap("kj", "<ESC>");

-- Easier pasting
util.nnoremap("[p", ":pu!<cr>")
util.nnoremap("]p", ":pu<cr>")

-- Clear search with <esc>
util.map("", "<esc>", ":noh<cr>")
util.nnoremap("gw", "*N")
util.xnoremap("gw", "*N")

-- Saves & Quite
util.nnoremap("<C-s>", ":w <CR>");
util.vnoremap("<C-s>", ":w <CR>")
util.inoremap("<C-s>", "<ESC>:w <CR>")
util.nnoremap("<C-c>", "<ESC> <CR>")

util.nnoremap("<C-Q>", ":x <CR>");
util.vnoremap("<C-Q>", ":x <CR>")
util.inoremap("<C-Q>", "<ESC>:x <CR>")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
util.nnoremap("n", "'Nn'[v:searchforward]", {
    expr = true
})
util.xnoremap("n", "'Nn'[v:searchforward]", {
    expr = true
})
util.onoremap("n", "'Nn'[v:searchforward]", {
    expr = true
})
util.nnoremap("N", "'nN'[v:searchforward]", {
    expr = true
})
util.xnoremap("N", "'nN'[v:searchforward]", {
    expr = true
})
util.onoremap("N", "'nN'[v:searchforward]", {
    expr = true
})
-- better indenting
util.vnoremap("<", "<gv")
util.vnoremap(">", ">gv")

-- NvimTree
util.nnoremap("<C-f>", ":Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<cr>")
util.inoremap("<C-f>", "<esc>:Telescope current_buffer_fuzzy_find fuzzy=false case_mode=ignore_case<cr>")
util.nnoremap("<leader>e", ":NvimTreeToggle<CR>")
util.inoremap("<C-e>", "<esc>:NvimTreeToggle<CR>")
util.nnoremap("<leader>er", ":NvimTreeRefresh<CR>")
util.nnoremap("<leader>en", ":NvimTreeFindFile<CR>")

-- ZenMode
util.nnoremap("<leader>z", ":ZenMode<cr>")

-- makes * and # work on visual mode too.
vim.api.nvim_exec([[
  function! g:VSetSearch(cmdtype)
    let temp = @s
    norm! gv"sy
    let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
    let @s = temp
  endfunction

  xnoremap * :<C-u>call g:VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
  xnoremap # :<C-u>call g:VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
]], false)

-- Terminal
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new({
    cmd = "lazygit",
    direction = "float",
    hidden = true
})

function _lazygit_toggle()
    lazygit:toggle()
end

util.nnoremap("<leader>g", "<cmd>lua _lazygit_toggle()<CR>")
