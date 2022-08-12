local hop = require("hop")

hop.setup({})

local map = vim.keymap.set
map("n", "''", require("hop").hint_words)
map("x", "''", require("hop").hint_words)
map("n", "'<CR>", require("hop").hint_lines)
map("x", "'<CR>", require("hop").hint_lines)
