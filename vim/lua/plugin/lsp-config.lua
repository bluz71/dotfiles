-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local nvim_lsp = require("lspconfig")
local cmp_lsp = require("cmp_nvim_lsp")
local handlers = require("util.lsp-handlers")
local dart_closing_labels = require("util.dart-closing-labels")
local diagnostic_style = require("util.diagnostic-style")
local fn = vim.fn
local lsp = vim.lsp
local map = vim.keymap.set

-- Preferred global diagnostic style for 'vim.diagnostic.*' displaying
-- functions.
vim.diagnostic.config(diagnostic_style.config())

-- Diagnostic symbols for display in the sign column.
vim.cmd([[
  sign define DiagnosticSignError text=▶ texthl=DiagnosticSignError
  sign define DiagnosticSignWarn  text=▶ texthl=DiagnosticSignWarn
  sign define DiagnosticSignInfo  text=▶ texthl=DiagnosticSignInfo
  sign define DiagnosticSignHint  text=▶ texthl=DiagnosticSignHint
]])

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
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  map("n", "'d", '<cmd>lua vim.diagnostic.open_float(0, {scope = "line"})<CR>', opts)

  -- Formatting is conditional on server capabilities.
  if client.resolved_capabilities.document_formatting then
    map("n", "'f", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 3000)<CR>", opts)
  end
  if client.resolved_capabilities.document_range_formatting then
    map("x", "'f", "<cmd>lua vim.lsp.buf.range_formatting()<CR><Esc>", opts)
  end

  -- Disable formatting for certain Language Servers; instead let null-ls handle
  -- formatting for the pertinent filetypes.
  if client.name == "dartls" or client.name == "solargraph" or client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
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
  on_attach = lsp_on_attach,
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
    ['rust-analyzer'] = {
      checkOnSave = {
        command = "clippy",
        extraArgs = { "--", "-Aclippy::needless_return" }
      }
    }
  }
})

nvim_lsp.solargraph.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  handlers = {
    ["textDocument/publishDiagnostics"] = handlers.no_diagnostics,
  },
  single_file_support = true, -- Allow LSP to work in standalone Ruby scripts
  settings = { solargraph = { diagnostics = false } },
})

nvim_lsp.tsserver.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("package.json"),
})
