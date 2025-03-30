local cmd = vim.cmd
local diagnostic = vim.diagnostic
local map = vim.keymap.set

diagnostic.config({
  float = {
    show_header = false,
    source = "if_many",
    border = "single",
  },
  severity_sort = true,
  signs = {
    culhl = {
      [vim.diagnostic.severity.ERROR] = "BufferVisibleERROR",
      [vim.diagnostic.severity.WARN] = "BufferVisibleWARN",
      [vim.diagnostic.severity.INFO] = "BufferVisibleINFO",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
      [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
      [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
    },
    severity = {
      min = vim.diagnostic.severity.INFO,
    },
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
    },
  },
  update_in_insert = false,
  underline = false,
  virtual_text = {
    current_line = true,
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
