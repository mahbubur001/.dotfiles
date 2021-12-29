-- Plugins
require("util")
require("user.options")

-- no need to load this immediately, since we have packer_compiled
vim.defer_fn(function()
    require("user.plugins")
    require("user.keymaps")
end, 0)
