-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local nvim_lsp = require("lspconfig")
local lsp_capabilities = require("util.lsp-capabilities")
local handlers = require("util.lsp-handlers")
local dart_closing_labels = require("util.dart-closing-labels")
local lsp = vim.lsp
local map = vim.keymap.set

-- Custom on attach function.
local lsp_on_attach = function(client)
  -- Mappings.
  local opts = { buffer = true }
  map("n", "ga", vim.lsp.buf.code_action, opts)
  map("n", "gd", vim.lsp.buf.definition, opts)
  map("n", "gD", vim.lsp.buf.declaration, opts)
  map("n", "gi", vim.lsp.buf.implementation, opts)
  map("n", "K", vim.lsp.buf.hover, opts)
  map("n", "gr", vim.lsp.buf.references, opts)
  map("n", "gR", vim.lsp.buf.rename, opts)
  map("i", "<C-k>", vim.lsp.buf.signature_help, opts)

  -- Formatting is conditional on server capabilities.
  if client.server_capabilities.document_formatting then
    map("n", "'f", vim.lsp.buf.format, opts)
  end
  if client.server_capabilities.document_range_formatting then
    map("x", "'f", vim.lsp.buf.range_formatting, opts)
  end
end

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
local capabilities = lsp.protocol.make_client_capabilities()
capabilities = lsp_capabilities.update_capabilities(capabilities)

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

nvim_lsp.tsserver.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("package.json"),
})
