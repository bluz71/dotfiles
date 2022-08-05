local npairs = require("nvim-autopairs")

npairs.setup({
  disable_filetype = { "text", "txt", "TelescopePrompt" },
  fast_wrap = {},
})

-- Map 'Enter'.
_G.npairs = npairs
vim.keymap.set("i", "<CR>", "v:lua.npairs.autopairs_cr()", { expr = true })
