-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local nvim_lsp = require('lspconfig')
local handlers = require('lsp-handlers')
local cmp_lsp = require('cmp_nvim_lsp')
local dart_closing_labels = require('dart-closing-labels')

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define LspDiagnosticsSignError text=✖')
vim.cmd('sign define LspDiagnosticsSignWarning text=✖')
vim.cmd('sign define LspDiagnosticsSignInformation text=✖')
vim.cmd('sign define LspDiagnosticsSignHint text=✖')

-- Custom on attach function.
local lsp_on_attach = function(client)
  -- Mappings.
  local map = vim.api.nvim_buf_set_keymap
  local opts = {noremap = true, silent = true}
  map(0, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  map(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  map(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  map(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  map(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  map(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  map(0, 'n', 'gR','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  map(0, 'i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  map(0, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
  map(0, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
  map(0, 'n', "'d", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border = "single"})<CR>', opts)
  map(0, 'n', "'D", '<cmd>lua require("lsp-diagnostics").toggle()<CR>', opts)

  -- LSP-based omnifunc.
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Indicate when language server is ready.
  print('Language server is ready')
end

-- Global handlers.
vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
vim.lsp.handlers['textDocument/hover'] = handlers.hover
vim.lsp.handlers['textDocument/signatureHelp'] = handlers.signature_help

-- The nvim-cmp completion plugin supports most LSP capabilities; we should
-- notify the language servers about that.
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_lsp.update_capabilities(capabilities)

-- The Language Servers.
nvim_lsp.dartls.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 400},
  init_options = {closingLabels = true},
  handlers = {
    ['dart/textDocument/publishClosingLabels'] = dart_closing_labels.handler()
  }
})

nvim_lsp.html.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  cmd = {'vscode-html-language-server', '--stdio'},
  filetypes = {'eruby', 'html'},
  flags = {debounce_text_changes = 400}
})

nvim_lsp.solargraph.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 400},
  handlers = {
     ['textDocument/publishDiagnostics'] = handlers.no_diagnostics
  },
  settings = {solargraph = {diagnostics = false}}
})

nvim_lsp.tsserver.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = {debounce_text_changes = 400}
})
