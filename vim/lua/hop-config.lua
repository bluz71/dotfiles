local key_map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
key_map('n', "''", '<cmd>lua require"hop".hint_words()<CR>', opts)
key_map('x', "''", '<cmd>lua require"hop".hint_words()<CR>', opts)
key_map('n', "'<CR>", '<cmd>lua require"hop".hint_lines()<CR>', opts)
key_map('x', "'<CR>", '<cmd>lua require"hop".hint_lines()<CR>', opts)
