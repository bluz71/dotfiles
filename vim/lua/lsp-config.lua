-- See:
--  https://nathansmith.io/posts/neovim-lsp
--  https://rishabhrd.github.io/jekyll/update/2020/09/19/nvim_lsp_config.html
--  https://neovim.io/doc/user/lsp.html

local nvim_lsp   = require'nvim_lsp'
local completion = require'completion'

-- Disable diagnostics, use ALE instead.
vim.lsp.callbacks["textDocument/publishDiagnostics"] = function() end

-- Diagnostics symbols.
vim.api.nvim_command('sign define LspDiagnosticsErrorSign text=✖')
vim.api.nvim_command('sign define LspDiagnosticsWarningSign text=✖')
vim.api.nvim_command('sign define LspDiagnosticsInformationSign text=●')
vim.api.nvim_command('sign define LspDiagnosticsHintSign text=●')

-- Options for completion-nvim plugin.
vim.g.completion_enable_auto_hover      = 0
vim.g.completion_enable_auto_paren      = 0
vim.g.completion_enable_auto_signature  = 0
vim.g.completion_matching_strategy_list = {'exact'}
vim.g.completion_menu_length            = 0
vim.g.completion_sorting                = 'alphabet'
vim.g.completion_timer_cycle            = 200
vim.g.completion_trigger_keyword_length = 3

-- On attach function.
local lsp_on_attach = function(client)
  completion.on_attach(client)

  -- Mappings
  local opts = {noremap = true, silent = true}
  vim.fn.nvim_buf_set_keymap(0, 'n', 'ga','<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'n', 'gR','<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.fn.nvim_buf_set_keymap(0, 'i', '<c-h>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)

  -- Enable LSP omnifunc.
  vim.api.nvim_command('setlocal omnifunc=v:lua.vim.lsp.omnifunc')

  -- Indicate that LSP is ready.
  print("Language server is ready")
end

-- The Language Servers.
nvim_lsp.dartls.setup {
  on_attach = lsp_on_attach,
}

nvim_lsp.solargraph.setup {
  on_attach = lsp_on_attach,
}

nvim_lsp.tsserver.setup {
  on_attach = lsp_on_attach,
}
