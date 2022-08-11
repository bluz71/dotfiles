local cmd = vim.cmd
local g = vim.g
local opt_local = vim.opt_local

g.listcharsVisibility = true

local M = {}

-- Toggle the highlighting of special characters.
M.toggle = function()
  if g.listcharsVisibility then
    -- Brighten extended list characters.
    opt_local.listchars = "eol:$,tab:>-,trail:-"
    cmd([[
      highlight! link NonText WarningMsg
      highlight! link Whitespace WarningMsg
      IndentBlanklineDisable
    ]])
    print("(Brighten) ON")
    g.listcharsVisibility = false
  else
    -- Dim shortened list characters.
    opt_local.listchars = "tab:  ,trail:-"
    cmd([[
      highlight! link NonText LineNr
      highlight! link Whitespace Conceal
      IndentBlanklineEnable
    ]])
    print("(Brighten) OFF")
    g.listcharsVisibility = true
  end
end

return M
