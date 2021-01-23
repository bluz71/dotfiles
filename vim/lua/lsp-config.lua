-- See:
--  https://nathansmith.io/posts/neovim-lsp
--  https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
--  https://neovim.io/doc/user/lsp.html

local nvim_lsp   = require'lspconfig'
local completion = require'completion'

-- Custom diagnostic handler for the events and timer API (not yet available).
-- local diagnostic_flags = {
--   signs = {
--     severity_limit = 'Warning',
--   },
--   underline = false,
--   virtual_text = {
--     spacing = 2,
--     severity_limit = 'Warning',
--   },
-- }

-- local diagnostic_config = vim.deepcopy(diagnostic_flags)
-- diagnostic_config.display_diagnostics = false

-- local diagnostic_handler = vim.lsp.with(
--   vim.lsp.diagnostic.on_publish_diagnostics, diagnostic_config
-- )

-- function DiagnosticTimer()
--   vim.defer_fn(function()
--     vim.lsp.diagnostic.show_buffer_diagnostics(nil, nil, diagnostic_flags)
--   end, 500)
-- end

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

-- Diagnostics symbols for display in the sign column.
vim.cmd('sign define LspDiagnosticsSignError text=✖')
vim.cmd('sign define LspDiagnosticsSignWarning text=✖')
vim.cmd('sign define LspDiagnosticsSignInformation text=●')
vim.cmd('sign define LspDiagnosticsSignHint text=●')

-- Options for completion-nvim plugin.
vim.g.completion_enable_auto_hover      = 0
vim.g.completion_enable_auto_paren      = 0
vim.g.completion_enable_auto_signature  = 0
vim.g.completion_matching_strategy_list = {'exact'}
vim.g.completion_menu_length            = 0
vim.g.completion_sorting                = 'alphabet'
vim.g.completion_trigger_keyword_length = 2
vim.g.completion_confirm_key            = ''

-- On attach function.
local lsp_on_attach = function(client)
  completion.on_attach(client)

  -- Update diagnostics when saving the current buffer to disk for the events
  -- and timer API (not yet available).
  -- vim.cmd('autocmd BufWrite <buffer> lua DiagnosticTimer()')

  -- Mappings.
  local opts = {noremap = true, silent = true}
  vim.api.nvim_buf_set_keymap(0, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', 'gR','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'i', '<c-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '<Space>=', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next({severity_limit = "Warning"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev({severity_limit = "Warning"})<CR>', opts)
  vim.api.nvim_buf_set_keymap(0, 'n', '<Space>d', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)

  -- Enable LSP omnifunc.
  vim.cmd('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

  -- Indicate that LSP is ready.
  print('Language server is ready')
end

-- The Language Servers.
nvim_lsp.dartls.setup {
  on_attach = lsp_on_attach,
  flags = { allow_incremental_sync = true },
  init_options = { closingLabels = true },
  handlers = {
    ['textDocument/publishDiagnostics'] = diagnostic_handler,
    ['dart/textDocument/publishClosingLabels'] = require('dart-closing-labels').handler()
  }
}

nvim_lsp.solargraph.setup {
  on_attach = lsp_on_attach,
  handlers = {
    ['textDocument/publishDiagnostics'] = none_diagnostic_handler
  }
}

nvim_lsp.tsserver.setup {
  on_attach = lsp_on_attach,
  flags = { allow_incremental_sync = true },
  handlers = {
    ['textDocument/publishDiagnostics'] = diagnostic_handler
  }
}
