-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local nvim_lsp = require("lspconfig")
local nvim_lsp_windows = require("lspconfig.ui.windows")
local buffer = require("util.buffer")
local dart_closing_labels = require("util.dart-closing-labels")
local handlers = require("util.lsp-handlers")
local lsp_capabilities = require("util.lsp-capabilities")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local lsp = vim.lsp
local map = vim.keymap.set
local opt_local = vim.opt_local

-- Custom on attach function.
local lsp_on_attach = function(client)
  -- Disable LSP for files larger than 100KB.
  if buffer.is_large(0) then
    print("(LSP) DISABLED, file too large")
    vim.cmd([[LspStop]])
    return
  end

  -- Mappings.
  local opts = { buffer = true }
  map("n", "ga", lsp.buf.code_action, opts)
  map("n", "gd", lsp.buf.definition, opts)
  map("n", "gD", lsp.buf.declaration, opts)
  map("n", "gi", lsp.buf.implementation, opts)
  map("n", "K", lsp.buf.hover, opts)
  map("n", "gr", lsp.buf.references, opts)
  map("n", "gR", lsp.buf.rename, opts)
  map("i", "<C-k>", lsp.buf.signature_help, opts)

  -- Fuzzy mappings using Telescope.
  map("n", "<Space>lr", require("telescope.builtin").lsp_references)
  map("n", "<Space>lw", require("telescope.builtin").lsp_document_symbols)
  map("n", "<Space>lW", function()
    require("telescope.builtin").lsp_workspace_symbols({
      query = vim.fn.input("LSP Workspace Symbols❯ "),
    })
  end)

  -- Formatting is conditional on server capabilities.
  if client.server_capabilities.document_formatting then
    map("n", "'f", lsp.buf.format, opts)
  end
  if client.server_capabilities.document_range_formatting then
    map("x", "'f", lsp.buf.range_formatting, opts)
  end

  -- Disable Neovim LSP-set 'omnifunc' and 'formatexpr' options; these options
  -- cause problems with the VimCompletesMe plugin and 'gq' command.
  opt_local.omnifunc = ""
  opt_local.formatexpr = ""
end

-- Add border to LSP windows such as `:LspInfo`.
nvim_lsp_windows.default_options.border = "single"

-- Custom on attach function which also disables formatting where null-ls will
-- be used to format.
local lsp_on_attach_no_formatting = function(client)
  client.server_capabilities.document_formatting = false
  client.server_capabilities.document_range_formatting = false

  lsp_on_attach(client)
end

-- Global handlers.
lsp.handlers["textDocument/hover"] = handlers.hover
lsp.handlers["textDocument/signatureHelp"] = handlers.signature_help

-- The nvim-cmp completion plugin supports most LSP capabilities; we should
-- notify the language servers about that.
local capabilities = lsp_capabilities.default_capabilities()

-- The Language Servers.
nvim_lsp.dartls.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  init_options = { closingLabels = true },
  handlers = {
    ["dart/textDocument/publishClosingLabels"] = dart_closing_labels.handler(),
  },
  root_dir = nvim_lsp.util.root_pattern("pubspec.yaml"),
})

nvim_lsp.html.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  cmd = { "vscode-html-language-server", "--stdio" },
  filetypes = { "eruby", "html" },
  flags = { debounce_text_changes = 300 },
})

nvim_lsp.rust_analyzer.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("Cargo.toml"),
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
        extraArgs = { "--", "-Aclippy::needless_return" },
      },
    },
  },
})

nvim_lsp.solargraph.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  single_file_support = true, -- Allow LSP to work in standalone Ruby scripts
  settings = { solargraph = { diagnostics = false } },
})

nvim_lsp.svelte.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
})

nvim_lsp.tsserver.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("package.json"),
})

-- Standard Ruby LSP is not yet part of nvim-lspconfig, so we need to start it
-- ourselves.
autocmd("FileType", {
  pattern = "ruby",
  group = augroup("StandardRubyLSP", {}),
  callback = function()
    vim.lsp.start({
      name = "standardrb",
      cmd = { "standardrb", "--lsp" },
    })
    map("n", "'f", lsp.buf.format, { buffer = true })
  end,
})
