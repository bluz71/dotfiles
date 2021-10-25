local npairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')
local cond = require('nvim-autopairs.conds')

npairs.setup({
  disable_filetype = {'text', 'TelescopePrompt'},
  fast_wrap = {}
})

-- Disable certain rules per filetype.
npairs.remove_rule('"')
npairs.add_rules({
  Rule('"', '"')
    :with_pair(cond.not_filetypes({'vim'}))
  }
)

-- Endwise rules.
npairs.add_rules(require('nvim-autopairs.rules.endwise-lua'))
npairs.add_rules(require('nvim-autopairs.rules.endwise-ruby'))

-- Map 'Enter'.
_G.npairs = npairs;
local map = vim.api.nvim_set_keymap
local opts = {expr = true , noremap = true}
map('i' , '<CR>','v:lua.npairs.autopairs_cr()', opts)
