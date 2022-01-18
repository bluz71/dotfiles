local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
  disable_filetype = { "txt", "TelescopePrompt" },
  fast_wrap = {},
})

-- Endwise rules.
npairs.add_rules(require("nvim-autopairs.rules.endwise-lua"))
npairs.add_rules(require("nvim-autopairs.rules.endwise-ruby"))

-- Map 'Enter'.
_G.npairs = npairs
local map = vim.api.nvim_set_keymap
local opts = { expr = true, noremap = true }
map("i", "<CR>", "v:lua.npairs.autopairs_cr()", opts)
