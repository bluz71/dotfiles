local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
  disable_filetype = { "txt", "TelescopePrompt" },
  fast_wrap = {},
})

-- Map 'Enter'.
_G.npairs = npairs
local map = vim.api.nvim_set_keymap
local opts = { expr = true, noremap = true }
map("i", "<CR>", "v:lua.npairs.autopairs_cr()", opts)
