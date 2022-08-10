local diagnostic = vim.diagnostic
local g = vim.g

g.diagnosticVisibility = true

local M = {}

-- Toggle Neovim diagnostic.
M.toggle = function()
  if g.diagnosticVisibility then
    diagnostic.disable()
    -- Disable mistfly statusline diagnostic indicator.
    g.mistflyWithNvimDiagnosticStatus = false
    print("(Diagnostic) OFF")
    g.diagnosticVisibility = false
  else
    vim.diagnostic.enable()
    -- Enable mistfly statusline diagnostic indicator.
    g.mistflyWithNvimDiagnosticStatus = true
    print("(Diagnostic) ON")
    g.diagnosticVisibility = true
  end
end

return M
