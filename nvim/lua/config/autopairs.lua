local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require('nvim-autopairs.conds')

npairs.setup({
  disable_filetype = { "text", "txt", "TelescopePrompt" },
  ignored_next_char = [=[[%w%%%'%(%[%{%"%.%`%$%,%/%■]]=],
})

npairs.add_rules({
  Rule("|", "|", { "ruby" }):with_move(cond.done()),
})
