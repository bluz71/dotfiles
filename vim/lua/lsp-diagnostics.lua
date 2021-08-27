local handlers = require('lsp-handlers')

-- A flag used to indicate whether diagnostics are visible or hidden.
vim.g.lsp_diagnostics_visible = true

local M = {}

-- Toggleable diagnostics function.
M.toggle = function()
  if vim.g.lsp_diagnostics_visible then
    vim.g.lsp_diagnostics_visible = false
    vim.lsp.diagnostic.clear(0)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.no_diagnostics
    print('Diagnostics are hidden')
  else
    vim.g.lsp_diagnostics_visible = true
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
    print('Diagnostics are visible')
  end
end

return M
