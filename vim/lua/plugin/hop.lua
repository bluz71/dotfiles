local hop = require("hop")

hop.setup({})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "''", '<cmd>lua require"hop".hint_words()<CR>', opts)
map("x", "''", '<cmd>lua require"hop".hint_words()<CR>', opts)
map("n", "'<CR>", '<cmd>lua require"hop".hint_lines()<CR>', opts)
map("x", "'<CR>", '<cmd>lua require"hop".hint_lines()<CR>', opts)
