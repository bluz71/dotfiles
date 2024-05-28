local diagnostic = vim.diagnostic
local g = vim.g
local tbl_extend = vim.tbl_extend

g.diagnostic_visibility = true

local M = {}

-- Toggle Neovim diagnostic.
M.toggle = function()
  if g.diagnostic_visibility then
    diagnostic.enable(not diagnostic.is_enabled())
    -- Disable linefly diagnostic indicator.
    g.linefly_options = tbl_extend("force", g.linefly_options, {
      with_diagnostic_status = false,
    })
    print("(Diagnostic) OFF")
    g.diagnostic_visibility = false
  else
    diagnostic.enable(not diagnostic.is_enabled())
    -- Enable linefly diagnostic indicator.
    g.linefly_options = tbl_extend("force", g.linefly_options, {
      with_diagnostic_status = true,
    })
    print("(Diagnostic) ON")
    g.diagnostic_visibility = true
  end
  vim.cmd([[redrawstatus!]])
end

return M
