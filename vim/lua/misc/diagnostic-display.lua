-- Enable or disable LSP diagnostics (see ~/dotfiles/vim/autoload/linting.vim).

local handlers = require('misc.lsp-handlers')
local diagnostic = vim.diagnostic
local fn = vim.fn
local lsp = vim.lsp

local M = {}

M.enable = function()
  lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
  if fn.has('nvim-0.6') == 1 then
    diagnostic.enable()
  end
end

M.disable = function()
  if fn.has('nvim-0.6') == 1 then
    diagnostic.disable()
  else
    lsp.diagnostic.clear(0)
  end
  lsp.handlers["textDocument/publishDiagnostics"] = handlers.no_diagnostics
end

return M
