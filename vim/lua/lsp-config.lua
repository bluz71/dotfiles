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
vim.cmd('sign define LspDiagnosticsSignInformation text=✖')
vim.cmd('sign define LspDiagnosticsSignHint text=✖')

-- A flag used to indicate whether diagnostics are visible or hidden.
vim.g.lsp_diagnostics_visible = true

-- Toggleable diagnostics function.
function _G.toggle_lsp_diagnostics()
  if vim.g.lsp_diagnostics_visible then
    vim.g.lsp_diagnostics_visible = false
    vim.lsp.diagnostic.clear(0)
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.no_diagnostics
    print('Diagnostics are hidden')
  else
    vim.g.lsp_diagnostics_visible = true
    vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
    print('Diagnostics are visible')
  end
end

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
  vim.api.nvim_buf_set_keymap(0, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({severity_limit = "Warning", popup_opts = {border = "single"}})<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '<Space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics({border = "single"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '<Space>D', '<cmd>lua toggle_lsp_diagnostics()<CR>', opts)

  -- LSP-based omnifunc.
  --vim.bo.omnifunc = vim.lsp.omnifunc
  vim.bo.omnifunc = 'v:lua.vim.lsp.omnifunc'

  -- Indicate when language server is ready.
  print('Language server is ready')
end

-- Global handlers.
vim.lsp.handlers["textDocument/publishDiagnostics"] = handlers.diagnostics
vim.lsp.handlers['textDocument/hover'] = handlers.hover
vim.lsp.handlers['textDocument/signatureHelp'] = handlers.signature_help

-- The Language Servers.
nvim_lsp.dartls.setup {
  on_attach = lsp_on_attach,
  flags = {debounce_text_changes = 500},
  init_options = {closingLabels = true},
  handlers = {
    ['dart/textDocument/publishClosingLabels'] = dart_closing_labels.handler()
  }
}

nvim_lsp.html.setup {
  on_attach = lsp_on_attach,
  cmd = {'vscode-html-language-server', '--stdio'},
  filetypes = {'eruby', 'html'},
  flags = {debounce_text_changes = 500}
}

nvim_lsp.solargraph.setup {
  on_attach = lsp_on_attach,
  flags = {debounce_text_changes = 500},
  handlers = {
     ['textDocument/publishDiagnostics'] = handlers.no_diagnostics
  },
  settings = {solargraph = {diagnostics = false}}
}

nvim_lsp.tsserver.setup {
  on_attach = lsp_on_attach,
  flags = {debounce_text_changes = 500}
}
