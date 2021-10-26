local diagnostic_style = require('util.diagnostic-style')

local M = {}

-- Custom diagnostic handler.
M.diagnostics = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_style.config()
)

-- Empty diagnostic handler.
M.no_diagnostics = function() end

-- Add borders to hover windows.
M.hover = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = 'single'
  }
)

-- Also add borders to signature help windows.
M.signature_help = vim.lsp.with(
  vim.lsp.handlers.signature_help, {
    border = 'single'
  }
)

return M
