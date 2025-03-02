local opt = vim.opt

local M = {}

-- Toggle crosshair.
M.toggle = function()
  if opt.cursorcolumn:get() then
    opt.cursorcolumn = false
    opt.cursorlineopt = "number"
  else
    opt.cursorcolumn = true
    opt.cursorlineopt = "both"
  end
end

return M
