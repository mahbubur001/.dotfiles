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

-- Move Lines
util.nnoremap("<^[[1;3A>", ":m .+1<CR>==")
util.vnoremap("M-Down>", ":m '>+1<CR>gv=gv")
util.inoremap("<M-Down>", "<Esc>:m .+1<CR>==gi")
util.nnoremap("<M-Up>", ":m .-2<CR>==")
util.vnoremap("<M-Up>", ":m '<-2<CR>gv=gv")
util.inoremap("<M-Up>", "<Esc>:m .-2<CR>==gi")

-- Switch buffers with tab
util.nnoremap("<S-Tab>", ":bprevious <cr>")
util.nnoremap("<Tab>", ":bnext<cr>")

-- Insert
util.inoremap("jk", "<ESC>");

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

-- Add undo break-points
util.inoremap(",", ",<c-g>u")
util.inoremap(".", ".<c-g>u")
util.inoremap(";", ";<c-g>u")

-- better indenting
util.vnoremap("<", "<gv")
util.vnoremap(">", ">gv")

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
