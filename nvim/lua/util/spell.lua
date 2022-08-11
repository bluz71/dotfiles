local opt_local = vim.opt_local

local M = {}

M.toggle = function()
  opt_local.spell = not (opt_local.spell:get()) -- Toggle 'spell' option
  if opt_local.spell:get() then
    opt_local.complete = opt_local.complete + "kspell"
    print("(Spelling) ON")
  else
    opt_local.complete = opt_local.complete - "kspell"
    print("(Spelling) OFF")
  end
end

return M
