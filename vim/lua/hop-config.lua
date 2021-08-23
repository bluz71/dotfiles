local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', "''", ':HopWord<CR>', opts)
vim.api.nvim_set_keymap('n', "'<CR>", ':HopLine<CR>', opts)
