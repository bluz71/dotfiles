local diagnostic = vim.diagnostic
local g = vim.g
local tbl_extend = vim.tbl_extend

g.diagnostic_visibility = true

local M = {}

-- Toggle Neovim diagnostic.
M.toggle = function()
  if g.diagnostic_visibility then
    diagnostic.disable()
    -- Disable linefly diagnostic indicator.
    g.linefly_options = tbl_extend("force", g.linefly_options, {
      with_diagnostic_status = false,
    })
    print("(Diagnostic) OFF")
    g.diagnostic_visibility = false
  else
    diagnostic.enable()
    -- Enable linefly diagnostic indicator.
    g.linefly_options = tbl_extend("force", g.linefly_options, {
      with_diagnostic_status = true,
    })
    print("(Diagnostic) ON")
    g.diagnostic_visibility = true
  end
end

return M
