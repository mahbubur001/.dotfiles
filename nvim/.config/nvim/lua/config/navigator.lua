require'navigator'.setup({
  debug = false,
  width = 0.75,
  height = 0.3,
  preview_height = 0.35,
  border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"},
  default_mapping = true,  -- set to false if you will remap every key
  keymaps = {{key = "gK", func = "declaration()"}},
})
