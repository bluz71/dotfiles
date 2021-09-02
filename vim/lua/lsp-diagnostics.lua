local handlers = require('lsp-handlers')

local M = {}

-- Toggleable diagnostics function (see ~/dotfiles/vim/autoload/linting.vim).
M.toggle = function()
  if vim.g.lintingActive then
    vim.lsp.diagnostic.clear(0)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.no_diagnostics
  else
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
  end
end

return M
