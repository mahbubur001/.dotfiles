-- local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")
local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local previewers = require("telescope.previewers")
local action_state = require("telescope.actions.state")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local telescope = require("telescope")

telescope.setup({
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true
        }
    },
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<c-t>"] = trouble.open_with_trouble
            }
        },
        prompt_prefix = " ",
        selection_caret = " ",
        winblend = 10,
        color_devicons = true,
        file_previewer = previewers.vim_buffer_cat.new,
		    grep_previewer = previewers.vim_buffer_vimgrep.new,
		    qflist_previewer = previewers.vim_buffer_qflist.new,
    }
})

-- telescope.load_extension("frecency")
telescope.load_extension("fzy_native")
telescope.load_extension("z")
-- telescope.load_extension("project")

local M = {}

M.project_files = function(opts)
    opts = opts or {}

    local _git_pwd = vim.fn.systemlist("git rev-parse --show-toplevel")[1]

    if vim.v.shell_error ~= 0 then
        local client = vim.lsp.get_active_clients()[1]
        if client then
            opts.cwd = client.config.root_dir
        end
        require("telescope.builtin").find_files(opts)
        return
    end

    require("telescope.builtin").git_files(opts)
end

M.search_dotfiles = function()
	require("telescope.builtin").find_files({
		prompt_title = "< VimRC >",
		cwd = vim.env.DOTFILES,
		hidden = true,
	})
end

M.find_in_current_buffer = function()
	require("telescope.builtin").current_buffer_fuzzy_find({
		prompt_title = "Find at current file",
		case_mode = 'ignore_case',
		fuzzy = false,
	})
end
M.find_tags_in_current_buffer = function()
	require("telescope.builtin").current_buffer_tags({
		prompt_title = "Find tags",
		case_mode = 'ignore_case',
		fuzzy = false,
	})
end

M.find_in_project = function()
	require("telescope.builtin").live_grep({
		prompt_title = "Find in working directory",
		case_mode = 'ignore_case',
		fuzzy = false,
	})
end

M.find_rectnt_files = function()
	require("telescope.builtin").oldfiles({prompt_title = "< Recent Files >"})
end

local util = require("util")
util.nnoremap("<C-f>", M.find_in_current_buffer)
util.inoremap("<C-f>", M.find_in_current_buffer)
util.nnoremap("<C-S-f>", M.find_in_current_buffer)
util.inoremap("<C-S-f>", M.find_in_current_buffer)

util.inoremap("<C-r>", M.find_tags_in_current_buffer)
util.nnoremap("<C-e>", M.find_rectnt_files)

util.nnoremap("<Leader><Space>", M.project_files)
util.nnoremap("<Leader>vrc", M.search_dotfiles)
util.nnoremap("<C-p>", M.project_files)
util.nnoremap("<Leader>fd", function()
    require("telescope.builtin").git_files({
        cwd = "~/.dotfiles"
    })
end)

util.nnoremap("<leader>fz", function()
    require("telescope").extensions.z.list({
        cmd = {vim.o.shell, "-c", "zoxide query -ls"}
    })
end)

util.nnoremap("<leader>pp", ":lua require'telescope'.extensions.project.project{}<CR>")

return M
