-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local conform = require("conform")
local map = vim.keymap.set

conform.setup({
  formatters_by_ft = {
    css = { "prettier" },
    dart = { "dart_format" },
    fish = { "fish_indent" },
    html = { "prettier" },
    javascript = { "standardjs" },
    json = { "prettier" },
    jsonc = { "prettier" },
    lua = { "stylua" },
    scss = { "prettier" },
    svelte = { "prettier" },
    typescript = { "prettier" },
    yml = { "prettier" },
  },
})

map("n", "'f", function()
  conform.format({ async = true, lsp_fallback = true, timeout_ms = 8000 })
end, { silent = true })
