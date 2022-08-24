local fn = vim.fn
local g = vim.g
local map = vim.keymap.set

g.vsnip_snippet_dir = fn.expand("~/dotfiles/nvim/vsnip")

local opts = { expr = true, remap = true, replace_keycodes = false }
map("i", "<C-j>", 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"', opts)
map("i", "<C-k>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"', opts)

-- Insert mode vsnip completion mapping - '<Control-s>'
-- Refer to ~/dotfiles/nvim/autoload/snippet.vim
map("i", "<C-s>", "<C-r>=snippet#Complete()<CR>", { silent = true})
