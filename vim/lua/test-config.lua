vim.cmd [[
  let test#strategy = 'neovim'
  let test#javascript#jest#executable = 'CI=true yarn test --colors'
]]

local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
map('n', "'tf", ':TestFile<CR>', opts)
map('n', "'tl", ':TestLast<CR>', opts)
map('n', "'ts", ':TestSuite<CR>', opts)
map('n', "'tt", ':TestNearest<CR>', opts)
