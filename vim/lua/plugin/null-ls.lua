-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local null_ls = require("null-ls")
local custom_sources = require("util.null-ls-sources")
local map = vim.keymap.set

null_ls.setup({
  should_attach = function(bufnr)
    -- Disable null-ls for files larger than 100K in size.
    return not (vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 100000)
  end,
  on_attach = function(client)
    -- Borrow existing formatting mapping from the LSP configuration. Whether a
    -- filetype is attached to a language server, or not, the following mapping
    -- will work for null-ls.
    local opts = { buffer = 0 }
    -- Neovim 0.7 API.
    map("n", "'f", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 8000)<CR>", opts)
    -- Neovim 0.8 API.
    -- map("n", "'f", "<cmd>lua vim.lsp.buf.format({ timeout_ms = 8000 })<CR>", opts)
  end,
  sources = {
    -- Builtin diagnostics.
    null_ls.builtins.diagnostics.jsonlint,
    null_ls.builtins.diagnostics.mdl,
    null_ls.builtins.diagnostics.standardjs.with({
      condition = function(utils)
        return utils.root_has_file("package.json")
      end,
    }),
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
        "--indent-width", "2",
      },
    }),

    -- Custom sources.
    custom_sources.formatting_dartfmt,
  },
})
