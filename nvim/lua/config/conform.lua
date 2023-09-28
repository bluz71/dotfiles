-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local conform = require("conform")
local map = vim.keymap.set

conform.setup({
  formatters_by_ft = {
    css = { "prettier" },
    dart = { "dart-format" },
    fish = { "fish_indent" },
    html = { "prettier" },
    json = { "prettier" },
    jsonc = { "prettier" },
    lua = { "stylua" },
    scss = { "prettier" },
    svelte = { "prettier" },
    typescript = { "prettier" },
    yml = { "prettier" },
  },
})

map("n", "'F", function()
  conform.format({ async = true, lsp_fallback = true, timeout_ms = 8000 })
end, { silent = true })
