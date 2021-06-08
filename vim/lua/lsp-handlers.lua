local M = {}

-- Custom diagnostic handler.
M.diagnostics = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = {
      severity_limit = 'Warning',
    },
    severity_sort = true,
    underline = false,
    update_in_insert = false,
    virtual_text = {
      spacing = 2,
      severity_limit = 'Warning',
    },
  }
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
