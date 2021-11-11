local map = vim.api.nvim_set_keymap
local actions = require('telescope.actions')
require('telescope').setup({
    defaults = {
        color_devicons = true,
        file_ignore_patterns = {'node_modules/.*', '.git/.*', '_site/.*', '.svn/.*'}
    },
    extensions = {
        fzf = {
            override_generic_sorter = false,
            override_file_sorter = true,
            case_mode = 'smart_case'
        }
    }
})
require('telescope').load_extension('gh')
require('telescope').load_extension('fzf')

-- " nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
-- nnoremap <C-p> :lua require('telescope.builtin').find_files()<CR>
-- nnoremap <leader>of :lua require('telescope.builtin').oldfiles()<CR>
-- nnoremap <leader>f :lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>

-- " nnoremap <leader>pw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
-- nnoremap <leader>fht :lua require('telescope.builtin').help_tags()<CR>
-- nnoremap <leader>bl :lua require('telescope.builtin').buffer({show_all_buffers = true})<CR>
-- nnoremap <leader>ts :lua require('telescope.builtin').builtin()<CR>
-- nnoremap <leader>gb :lua require('telescope.builtin').git_branches({selection_strategy = 'row'})<CR>
-- nnoremap <leader>gl :lua require('telescope.builtin').git_commits({selection_strategy = 'row', prompt_title = 'git log'})<CR>
-- nnoremap <leader>gf :lua require('telescope.builtin').git_files()<CR>
