-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local null_ls = require("null-ls")
local custom_sources = require("util.null-ls-sources")
local map = vim.api.nvim_buf_set_keymap

null_ls.setup({
  on_attach = function(client)
    -- Borrow existing diagnostic and formatting mappings from the LSP
    -- configuration. Whether a filetype is attached to a language server, or
    -- not, the following mappings will work for null-ls.
    local opts = { noremap = true, silent = true }
    map(0, "n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
    map(0, "n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
    map(0, "n", "'d", '<cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>', opts)
    map(0, "n", "'f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
    map(0, "x", "'f", "<cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>", opts)
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
