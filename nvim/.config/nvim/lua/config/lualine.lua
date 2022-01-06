local function clock()
    return " " .. os.date("%I:%M %p")
end

local function lsp_progress(self, is_active)
    if not is_active then
        return ""
    end
    local messages = vim.lsp.util.get_progress_messages()
    if #messages == 0 then
        return ""
    end
    local status = {}
    for _, msg in pairs(messages) do
        table.insert(status, (msg.percentage or 0) .. "%% " .. (msg.title or ""))
    end
    local spinners = {"⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏"}
    local ms = vim.loop.hrtime() / 1000000
    local frame = math.floor(ms / 120) % #spinners
    return table.concat(status, " | ") .. " " .. spinners[frame + 1]
end

require'lualine'.setup {
  options = {
    icons_enabled = true,
    theme = "gruvbox-flat",
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch'},
    lualine_c = {'diff', 'diagnostics', 'filename'},
    lualine_x = { lsp_progress, 'encoding', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location', clock}
  },
  extensions = {"nvim-tree"}
}
