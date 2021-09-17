local handlers = require('lsp-handlers')

local M = {}

-- Toggleable diagnostics function (see ~/dotfiles/vim/autoload/linting.vim).
M.toggle = function()
  if vim.g.lintingActive then
    vim.lsp.diagnostic.clear(0) -- OLD API
    -- vim.diagnostic.hide()    -- NEW API
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.no_diagnostics
  else
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
    -- vim.diagnostic.show() -- NEW API
  end
end

return M
