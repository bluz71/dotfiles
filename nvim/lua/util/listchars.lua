local g = vim.g
local highlight = vim.api.nvim_set_hl
local opt_local = vim.opt_local

g.listcharsVisibility = true

local M = {}

-- Toggle the highlighting of special characters.
M.toggle = function()
  if g.listcharsVisibility then
    -- Brighten extended list characters.
    opt_local.listchars = { eol = "↵", tab = "<‧>", trail = "‧" }
    highlight(0, "NonText", { link = "WarningMsg" })
    highlight(0, "Whitespace", { link = "WarningMsg" })
    vim.cmd([[IBLDisable]])
    print("(Brighten) ON")
    g.listcharsVisibility = false
  else
    -- Dim shortened list characters.
    opt_local.listchars = { tab = "  ", trail = "‧" }
    highlight(0, "NonText", { link = "LineNr" })
    highlight(0, "Whitespace", { link = "Conceal" })
    vim.cmd([[IBLEnable]])
    print("(Brighten) OFF")
    g.listcharsVisibility = true
  end
end

return M
