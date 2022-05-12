-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local null_ls = require("null-ls")
local custom_sources = require("util.null-ls-sources")
local map = vim.keymap.set

null_ls.setup({
  on_attach = function(client)
    -- Borrow existing formatting mappings from the LSP configuration. Whether a
    -- filetype is attached to a language server, or not, the following mappings
    -- will work for null-ls.
    local opts = { buffer = 0 }
    map("n", "'f", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 8000)<CR>", opts)
    map("x", "'f", "<cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>", opts)
  end,
  sources = {
    -- Builtin diagnostics.
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.diagnostics.mdl,
    null_ls.builtins.diagnostics.standardjs,
    null_ls.builtins.diagnostics.standardrb,
    null_ls.builtins.diagnostics.yamllint,

    -- Builtin formatters.
    null_ls.builtins.formatting.prettier.with({
      filetypes = { "css", "json", "scss", "yml" },
    }),
    null_ls.builtins.formatting.prettier_standard,
    null_ls.builtins.formatting.standardrb,
    null_ls.builtins.formatting.stylua.with({
      extra_args = {
        "--column-width", "100",
        "--indent-type", "Spaces",
        "--indent-width", "2"
      },
    }),

    -- Custom sources.
    custom_sources.formatting_dartfmt,
  },
})
