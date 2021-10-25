local g = vim.g
local fn = vim.fn
local map = vim.api.nvim_set_keymap

g.vsnip_snippet_dir = fn.expand('~/dotfiles/vim/vsnip')

local opts = {expr = true, silent = true}
map('i', '<C-j>', 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"', opts)
map('i', '<C-k>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"', opts)

local opts = {noremap = true, silent = true}
-- Insert mode snippet completion mapping - '<Control-s>'
map('i', '<C-s>', '<C-r>=snippets#Complete()<CR>', opts)
