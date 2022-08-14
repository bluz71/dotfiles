local diagnostic_style = require("util.diagnostic-style")
local cmd = vim.cmd

-- Preferred global diagnostic style for 'vim.diagnostic.*' displaying
-- functions.
vim.diagnostic.config(diagnostic_style.config())

-- Diagnostic symbols for display in the sign column.
cmd([[
  sign define DiagnosticSignError text=▶ texthl=DiagnosticSignError
  sign define DiagnosticSignWarn  text=△ texthl=DiagnosticSignWarn
]])

local map = vim.keymap.set
map("n", "]d", function()
  vim.diagnostic.goto_next()
  cmd([[normal zz]])
end)
map("n", "[d", function()
  vim.diagnostic.goto_prev()
  cmd([[normal zz]])
end)
map("n", "'d", function()
  vim.diagnostic.open_float(0, {scope = "line"})
end)
