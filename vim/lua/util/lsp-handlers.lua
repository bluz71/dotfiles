local lsp = vim.lsp

local M = {}

-- Empty diagnostic handler, useful for when we wish to ignore a language
-- server's diagnostics.
M.no_diagnostics = function() end

-- Add borders to hover windows.
M.hover = lsp.with(lsp.handlers.hover, {
  border = "single",
})

-- Also add borders to signature help windows.
M.signature_help = lsp.with(lsp.handlers.signature_help, {
  border = "single",
})

return M
