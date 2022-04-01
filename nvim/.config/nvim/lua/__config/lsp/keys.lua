local util = require("util")

local M = {}

function M.setup(client, bufnr)
  -- Mappings.
  local opts = { noremap = true, silent = true, buffer = bufnr }

  if client.name == "typescript" then
    util.nnoremap("gco", "<cmd>:TSLspOrganize<CR>", opts)
    util.nnoremap("gcr", "<cmd>:TSLspRenameFile<CR>", opts)
  end


  util.nnoremap("gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  util.nnoremap("gdv", "<cmd>vsplit | lua vim.lsp.buf.definition()<CR>", opts)
  util.nnoremap("gds", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)
  util.nnoremap("gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  util.nnoremap("gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  util.nnoremap("gr", "<cmd>Telescope lsp_references<CR>", opts)
  util.nnoremap("gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  util.nnoremap("gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  util.nnoremap("<leader>ca", ":<C-U>lua vim.lsp.buf.range_code_action()<CR>", opts)
  util.nnoremap("<leader>cr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- util.nnoremap("<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  -- util.nnoremap("<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  -- util.nnoremap("<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opts)
  -- util.nnoremap("<leader>ds", "<cmd>Telescope document_diagnostics<cr>", opts)
  -- util.nnoremap("<space>d", "<cmd>Telescope workspace_diagnostics<cr>", opts)

  util.nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  util.nnoremap("[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  util.nnoremap("]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  util.nnoremap("[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  util.nnoremap("]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

  local trigger_chars = client.resolved_capabilities.signature_help_trigger_characters
  trigger_chars = { "," }
  for _, c in ipairs(trigger_chars) do
    util.inoremap(c, function()
      vim.defer_fn(function()
        pcall(vim.lsp.buf.signature_help)
      end, 0)
      return c
    end, {
      noremap = true,
      silent = true,
      buffer = bufnr,
      expr = true,
    })
  end

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
      util.nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
      util.inoremap("<leader>f", "<ESC>:lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    util.vnoremap("<leader>f", "<cmd>lua vim.lsp.buf.range_formatting()<CR>", opts)
  end

 end

return M
