-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local nvim_lsp = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local handlers = require("util.lsp-handlers")
local dart_closing_labels = require("util.dart-closing-labels")
local fn = vim.fn
local lsp = vim.lsp
local map = vim.keymap.set

-- Custom on attach function.
local lsp_on_attach = function(client)
  -- Mappings.
  local opts = { buffer = 0 }
  map("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  map("n", "gR", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  map("i", "<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)

  -- Formatting is conditional on server capabilities.
  if client.server_capabilities.document_formatting then
    if vim.fn.has("nvim-0.8") == 1 then
      map("n", "'f", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
    else
      map("n", "'f", "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", opts)
    end
  end
  if client.server_capabilities.document_range_formatting then
    map("x", "'f", "<cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>", opts)
  end
end

-- Custom on attach function which also disables formatting where null-ls will
-- be used to format.
local lsp_on_attach_no_formatting = function(client)
  if vim.fn.has("nvim-0.8") == 1 then
    client.server_capabilities.document_formatting = false
    client.server_capabilities.document_range_formatting = false
  else
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end

  lsp_on_attach(client)
end

-- Global handlers.
lsp.handlers["textDocument/hover"] = handlers.hover
lsp.handlers["textDocument/signatureHelp"] = handlers.signature_help

-- The nvim-cmp completion plugin supports most LSP capabilities; we should
-- notify the language servers about that.
local capabilities = lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)

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
