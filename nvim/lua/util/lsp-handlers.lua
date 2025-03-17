local lsp = vim.lsp

local M = {}

-- Add borders to hover windows.
M.hover = lsp.with(lsp.handlers.hover, {
  border = "single",
})

-- Neovim 0.11
-- local hover = vim.lsp.buf.hover
-- vim.lsp.buf.hover = function()
--   hover({ border = "single" })
-- end

-- Also add borders to signature help windows.
M.signature_help = lsp.with(lsp.handlers.signature_help, {
  border = "single",
})

-- Neovim 0.11
-- local signature_help = vim.lsp.buf.signature_help
-- vim.lsp.buf.signature_help = function()
--   signature_help({ border = "single" })
-- end

return M
