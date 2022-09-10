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
    if vim.fn.getfsize(vim.api.nvim_buf_get_name(bufnr)) > 100000 then
      print("(null-ls) DISABLED, file too large")
      return false
    else
      return true
    end
  end,
  on_attach = function()
    -- Borrow existing formatting mapping from the LSP configuration. Whether a
    -- filetype is attached to a language server, or not, the following mapping
    -- will work for null-ls.
    local opts = { buffer = true }
    map("n", "'f", function()
      vim.lsp.buf.format({ timeout_ms = 8000 })
    end, opts)
    -- Disable null-ls attached 'omnifunc' since it causes problems for
    -- VimCompletesMe, especially Tab-completing in Lua files.
    vim.opt_local.omnifunc = ""
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
    null_ls.builtins.diagnostics.selene,
    null_ls.builtins.diagnostics.standardrb,
    null_ls.builtins.diagnostics.yamllint,

    -- Builtin formatters.
    null_ls.builtins.formatting.dart_format,
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
  },
})
