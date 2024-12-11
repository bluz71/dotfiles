-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local conform = require("conform")
local filereadable = vim.fn.filereadable
local map = vim.keymap.set

conform.setup({
  formatters_by_ft = {
    astro = { "prettier" },
    css = { "prettier" },
    eruby = function()
      if filereadable(".prettierrc.json") == 1 and filereadable("tailwind.config.js") == 1 then
        return { "prettier", "rustywind" }
      else
        return {} -- Do nothing for legacy Rails projects
      end
    end,
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
    rustywind = {
      args = {
        "--stdin",
        "--output-css-file",
        ".tailwind-output.css",
        "--custom-regex",
        "(?:class:[\\s\\n]*|class=)['\"]([^'\"]+)['\"]",
      },
    },
  },
})

map("n", "'f", function()
  conform.format({ async = true, lsp_fallback = true, timeout_ms = 8000 })
end, { silent = true })
