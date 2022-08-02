local hop = require("hop")

hop.setup({})

local map = vim.keymap.set
map("n", "''", '<cmd>lua require"hop".hint_words()<CR>')
map("x", "''", '<cmd>lua require"hop".hint_words()<CR>')
map("n", "'<CR>", '<cmd>lua require"hop".hint_lines()<CR>')
map("x", "'<CR>", '<cmd>lua require"hop".hint_lines()<CR>')
