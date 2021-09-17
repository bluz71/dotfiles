autopairs = require('nvim-autopairs')

autopairs.setup({
  disable_filetype = {'text', 'TelescopePrompt'},
  fast_wrap = {}
})

-- Endwise rules.
autopairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
autopairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

-- Map 'Enter'.
_G.autopairs = autopairs;
local map = vim.api.nvim_set_keymap
local opts = {expr = true , noremap = true}
map('i' , '<CR>','v:lua.autopairs.check_break_line_char()', opts)
