local cmd = vim.cmd
local diagnostic = vim.diagnostic
local map = vim.keymap.set
local sign_define = vim.fn.sign_define

-- Diagnostic symbols for display in the sign column.
sign_define("DiagnosticSignError", { text = "■", texthl = "DiagnosticSignError" })
sign_define("DiagnosticSignWarn", { text = "△", texthl = "DiagnosticSignWarn" })
sign_define("DiagnosticSignInfo", { text = "○", texthl = "DiagnosticSignInfo" })

-- Preferred global diagnostic style for 'vim.diagnostic.*' displaying
-- functions.
diagnostic.config({
  float = {
    show_header = false,
    source = "if_many",
    border = "single",
  },
  severity_sort = true,
  signs = {
    severity = {
      min = vim.diagnostic.severity.INFO,
    },
  },
  update_in_insert = false,
  underline = false,
  virtual_text = {
    prefix = function(message)
      if message.severity == diagnostic.severity.ERROR then
        return "■"
      elseif message.severity == diagnostic.severity.WARN then
        return "△"
      elseif message.severity == diagnostic.severity.INFO then
        return "○"
      else
        return "■"
      end
    end,
    spacing = 2,
    severity = {
      min = vim.diagnostic.severity.INFO,
    },
  },
})

map("n", "]d", function()
  diagnostic.goto_next()
  cmd([[normal zz]])
end)
map("n", "[d", function()
  diagnostic.goto_prev()
  cmd([[normal zz]])
end)
map("n", "'d", function()
  diagnostic.open_float(0, { scope = "line" })
end)
map("n", "'D", function()
  diagnostic.setloclist()
end)
