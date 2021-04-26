local util = require 'vim.lsp.util'

local M = {}

-- Custom diagnostic handler.
M.diagnostic = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = {
      severity_limit = 'Warning',
    },
    underline = false,
    update_in_insert = false,
    virtual_text = {
      spacing = 2,
      severity_limit = 'Warning',
    },
  }
)

-- Empty diagnostic handler.
M.none_diagnostic = function() end

-- Add borders to hover windows.
M.hover = vim.lsp.with(
  vim.lsp.handlers.hover, {
    border = {
      {'┌', 'FloatBorder'},
      {'─', 'FloatBorder'},
      {'┐', 'FloatBorder'},
      {'│', 'FloatBorder'},
      {'┘', 'FloatBorder'},
      {'─', 'FloatBorder'},
      {'└', 'FloatBorder'},
      {'│', 'FloatBorder'}
    }
  }
)

return M
