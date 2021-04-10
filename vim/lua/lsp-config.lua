-- See:
--  https://nathansmith.io/posts/neovim-lsp
--  https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
--  https://elianiva.me/post/my-nvim-lsp-setup
--  https://neovim.io/doc/user/lsp.html

local nvim_lsp = require'lspconfig'
local handlers = require'lsp-handlers'
local dart_closing_labels = require'dart-closing-labels'

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define LspDiagnosticsSignError text=✖')
vim.cmd('sign define LspDiagnosticsSignWarning text=✖')
vim.cmd('sign define LspDiagnosticsSignInformation text=●')
vim.cmd('sign define LspDiagnosticsSignHint text=●')

-- Custom on attach function.
local lsp_on_attach = function(client)
  -- Mappings.
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gR','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({severity_limit = "Warning"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({severity_limit = "Warning"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '<Space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

  -- LSP-based omnifunc.
  --vim.bo.omnifunc = vim.lsp.omnifunc
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Indicate when language server is ready.
  print('Language server is ready')
end

-- The Language Servers.
nvim_lsp.dartls.setup {
  on_attach = lsp_on_attach,
  flags = {debounce_did_change_notify = 300},
  init_options = {closingLabels = true},
  handlers = {
    ['textDocument/publishDiagnostics'] = handlers.diagnostic,
    ['textDocument/hover'] = handlers.hover,
    ['dart/textDocument/publishClosingLabels'] = dart_closing_labels.handler()
  }
}

nvim_lsp.html.setup {
  on_attach = lsp_on_attach,
  cmd = {'vscode-html-language-server', '--stdio'},
  filetypes = {'eruby', 'html'},
  handlers = {
    ['textDocument/publishDiagnostics'] = handlers.diagnostic,
    ['textDocument/hover'] = handlers.hover
  }
}

nvim_lsp.solargraph.setup {
  on_attach = lsp_on_attach,
  flags = {debounce_did_change_notify = 300},
  handlers = {
    ['textDocument/publishDiagnostics'] = handlers.none_diagnostic,
    ['textDocument/hover'] = handlers.hover
  },
  settings = {solargraph = {diagnostics = false}}
}

nvim_lsp.tsserver.setup {
  on_attach = lsp_on_attach,
  flags = {debounce_did_change_notify = 300},
  handlers = {
    ['textDocument/publishDiagnostics'] = handlers.diagnostic,
    ['textDocument/hover'] = handlers.hover
  }
}
