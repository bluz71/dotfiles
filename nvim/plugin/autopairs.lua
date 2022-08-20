local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require('nvim-autopairs.conds')

npairs.setup({
  disable_filetype = { "text", "txt", "TelescopePrompt" },
  fast_wrap = {},
})

npairs.add_rules({
  Rule("|", "|", { "ruby" }):with_move(cond.done()),
})
