-- Plugins
require("util")
require("my.options")

-- no need to load this immediately, since we have packer_compiled
vim.defer_fn(function()
    require("my.plugins")
    require("my.keymaps")
end, 0)
