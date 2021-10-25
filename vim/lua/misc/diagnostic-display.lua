-- Enable or disable LSP diagnostics (see ~/dotfiles/vim/autoload/linting.vim).
local handlers = require('misc.lsp-handlers')

local M = {}

M.enable = function()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
  if vim.fn.has('nvim-0.6') == 1 then
    vim.diagnostic.enable()
  end
end

M.disable = function()
  if vim.fn.has('nvim-0.6') == 1 then
    vim.diagnostic.disable()
  else
    vim.lsp.diagnostic.clear(0)
  end
  vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.no_diagnostics
end

return M
