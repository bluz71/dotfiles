-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local conform = require("conform")
local map = vim.keymap.set

conform.setup({
  formatters_by_ft = {
    astro = { "prettier" },
    css = { "prettier" },
    eruby = { "rustywind", "erb_format" },
    fish = { "fish_indent" },
    html = { "prettier" },
    javascript = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    lua = { "stylua" },
    scss = { "prettier" },
    typescript = { "prettier" },
    yaml = { "prettier" },
  },
  formatters = {
    erb_format = {
      args = {
        "--stdin",
        "--print-width",
        "100",
      },
    },
  },
})

map("n", "'f", function()
  conform.format({ async = true, lsp_fallback = true, timeout_ms = 8000 })
end, { silent = true })
