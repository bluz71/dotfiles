local fterm = require("FTerm")
local map = vim.keymap.set

fterm.setup({
  cmd = "lazygit",
  dimensions = {
    height = 0.9,
    width = 0.9,
  },
})

map("n", "<A-g>", fterm.toggle)
map("t", "<A-g>", "<C-\\><C-n><cmd>lua require('FTerm').toggle()<CR>")
