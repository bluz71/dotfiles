local handlers = require('lsp-handlers')

local M = {}

-- Toggleable diagnostics function (see ~/dotfiles/vim/autoload/linting.vim).
M.toggle = function()
  if vim.g.lintingActive then
    if vim.fn.has('nvim-0.6') == 1 then
      for k, _ in pairs(vim.diagnostic.get_namespaces()) do
        vim.diagnostic.hide(k)
      end
    else
      vim.lsp.diagnostic.clear(0)
    end
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.no_diagnostics
  else
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
  end
end

return M
