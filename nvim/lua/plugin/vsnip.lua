local g = vim.g
local fn = vim.fn
local map = vim.keymap.set

g.vsnip_snippet_dir = fn.expand("~/dotfiles/nvim/vsnip")

local opts = { expr = true, remap = true }
map("i", "<C-j>", 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"', opts)
map("i", "<C-k>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"', opts)

-- Insert mode snippet completion mapping - '<Control-s>'
map("i", "<C-s>", "<C-r>=snippets#Complete()<CR>")
