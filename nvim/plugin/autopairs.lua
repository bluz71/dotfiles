local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
  disable_filetype = { "text", "txt", "TelescopePrompt" },
  fast_wrap = {},
})

-- Map 'Enter'.
_G.npairs = npairs
vim.keymap.set("i", "<CR>", "v:lua.npairs.autopairs_cr()", { expr = true })
