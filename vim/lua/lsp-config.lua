-- See:
--  https://nathansmith.io/posts/neovim-lsp
--  https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
--  https://elianiva.me/post/my-nvim-lsp-setup
--  https://neovim.io/doc/user/lsp.html

local nvim_lsp = require'lspconfig'

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define LspDiagnosticsSignError text=✖')
vim.cmd('sign define LspDiagnosticsSignWarning text=✖')
vim.cmd('sign define LspDiagnosticsSignInformation text=●')
vim.cmd('sign define LspDiagnosticsSignHint text=●')

-- Custom diagnostic handler.
local diagnostic_handler = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = {
      severity_limit = 'Warning',
    },
    underline = false,
    update_in_insert = false,
    virtual_text = {
      spacing = 2,
      severity_limit = 'Warning',
    },
  }
)

-- Empty diagnostic handler.
local none_diagnostic_handler = function() end

-- Enable incremental synchronization if the language server supports it. This
-- is more efficient than sending the full buffer for each edit (the default
-- behaviour).
local lsp_on_init = function(client)
  client.config.flags = {}
  if client.config.flags then
    client.config.flags.allow_incremental_sync = true
  end
end

-- On attach function.
local lsp_on_attach = function(client)
  -- Mappings.
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gR','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'i', '<c-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '<Space>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({severity_limit = "Warning"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({severity_limit = "Warning"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '<Space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

  -- LSP-based omnifunc.
  vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

  -- Indicate when language server is ready.
  print('Language server is ready')
end

-- The Language Servers.
nvim_lsp.dartls.setup {
  on_init = lsp_on_init,
  on_attach = lsp_on_attach,
  init_options = {closingLabels = true},
  handlers = {
    ['textDocument/publishDiagnostics'] = diagnostic_handler,
    ['dart/textDocument/publishClosingLabels'] = require('dart-closing-labels').handler()
  }
}

nvim_lsp.html.setup {
  on_init = lsp_on_init,
  on_attach = lsp_on_attach,
  cmd = {'vscode-html-language-server', '--stdio'},
  filetypes = {'eruby', 'html'},
  handlers = {
    ['textDocument/publishDiagnostics'] = diagnostic_handler
  }
}

nvim_lsp.solargraph.setup {
  on_init = lsp_on_init,
  on_attach = lsp_on_attach,
  cmd = {'solargraph-logged'},
  handlers = {
    ['textDocument/publishDiagnostics'] = none_diagnostic_handler
  },
  settings = {
    solargraph = {
      diagnostics = false;
    };
  };
}

nvim_lsp.tsserver.setup {
  on_init = lsp_on_init,
  on_attach = lsp_on_attach,
  handlers = {
    ['textDocument/publishDiagnostics'] = diagnostic_handler
  }
}
