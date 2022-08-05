map = vim.keymap.set

local opts = { silent = true }
map("n", "'o", ":Obsession<CR>", opts)
map("n", "'O", ":Obsession!<CR>", opts)
