vim.g.mapleader = ' '
vim.api.nvim_set_keymap('n', '<Space>', '<NOP>', {
    noremap = true,
    silent = true
})


vim.api.nvim_set_keymap('x', 'K', ':move \'<-2<CR>gv-gv', {
    noremap = true,
    silent = true
})
vim.api.nvim_set_keymap('x', 'J', ':move \'>+1<CR>gv-gv', {
    noremap = true,
    silent = true
})

vim.cmd('inoremap <expr> <c-j> (\"\\<C-n>\")')
vim.cmd('inoremap <expr> <c-k> (\"\\<C-p>\")')
vim.cmd("vnoremap // y/\\V<C-R>=escape(@\",'/\')<CR><CR>")

local util = require("util")

vim.o.timeoutlen = 300

-- Move to window using the <ctrl> movement keys
util.nmap("<C-h>", "<C-w>h")
util.nmap("<C-j>", "<C-w>j")
util.nmap("<C-k>", "<C-w>k")
util.nmap("<C-l>", "<C-w>l")

-- Resize window using <ctrl> arrow keys
util.nnoremap("<C-S-Up>", ":resize +2<CR>")
util.nnoremap("<C-S-Down>", ":resize -2<CR>")
util.nnoremap("<C-S-Left>", ":vertical resize -2<CR>")
util.nnoremap("<C-S-Right>", ":vertical resize +2<CR>")


-- Switch buffers with tab
util.nnoremap("<S-Tab>", ":bprevious <cr>")
util.nnoremap("<Tab>", ":bnext<cr>")

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

-- Saves
util.nnoremap("<C-s>", ":w <CR>");
util.vnoremap("<C-s>", ":w <CR>")
util.inoremap("<C-s>", "<ESC>:w <CR>")

-- File open
util.nnoremap("<C-p>", ":Telescope find_files<cr>");
util.vnoremap("<C-p>", ":Telescope find_files<cr>")
util.inoremap("<C-p>", "<ESC>:Telescope find_files<cr>")

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
util.nnoremap("<C-e>", ":NvimTreeToggle<CR>")
util.inoremap("<C-e>", "<esc>:NvimTreeToggle<CR>")
util.nnoremap("<leader>r", ":NvimTreeRefresh<CR>")
util.nnoremap("<leader>n", ":NvimTreeFindFile<CR>")

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

