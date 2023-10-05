local npairs = require("nvim-autopairs")
local Rule = require("nvim-autopairs.rule")
local cond = require("nvim-autopairs.conds")

npairs.setup({
  disable_filetype = { "text", "txt", "TelescopePrompt" },
  ignored_next_char = [=[[%w%%%'%(%[%{%"%.%`%$%,%/%■]]=],
})

npairs.add_rules({
  Rule("|", "|", { "ruby" }):with_move(cond.done()),
})

-- Auto-complete LSP function & method parentheses via nvim-cmp plugin.
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
