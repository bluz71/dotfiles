local g = vim.g
g["test#strategy"] = "neovim"
g["test#javascript#jest#executable"] = "CI=true yarn test --colors"

local map = vim.keymap.set
local opts = { silent = true }
map("n", "'tt", ":TestNearest<CR>", opts)
map("n", "'tl", ":TestLast<CR>", opts)
map("n", "'tf", ":TestFile<CR>", opts)
map("n", "'ts", ":TestSuite<CR>", opts)
