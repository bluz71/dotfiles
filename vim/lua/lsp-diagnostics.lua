local handlers = require('lsp-handlers')

-- A flag used to indicate whether diagnostics are visible or hidden.
vim.g.lspDiagnosticsVisible = true

local M = {}

-- Toggleable diagnostics function.
M.toggle = function()
  if vim.g.lspDiagnosticsVisible then
    vim.g.lspDiagnosticsVisible = false
    vim.g.moonflyWithNvimLspIndicator = false
    vim.lsp.diagnostic.clear(0)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.no_diagnostics
    print('Diagnostics are hidden')
  else
    vim.g.lspDiagnosticsVisible = true
    vim.g.moonflyWithNvimLspIndicator = true
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
    print('Diagnostics are visible')
  end
end

return M
