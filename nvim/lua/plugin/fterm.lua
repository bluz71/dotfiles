local fterm = require("FTerm")
local map = vim.keymap.set

fterm.setup({
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

map("n", "<A-t>", fterm.toggle)
map("t", "<A-t>", "<C-\\><C-n><cmd>lua require('FTerm').toggle()<CR>")
