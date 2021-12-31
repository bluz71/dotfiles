-- Enable or disable LSP diagnostics (see ~/dotfiles/vim/autoload/linting.vim).

local handlers = require("util.lsp-handlers")
local diagnostic = vim.diagnostic
local fn = vim.fn
local lsp = vim.lsp

local M = {}

M.enable = function()
  lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
  diagnostic.enable()
end

M.disable = function()
  diagnostic.disable()
  lsp.handlers["textDocument/publishDiagnostics"] = handlers.no_diagnostics
end

return M
