local M = {}

M.config = function()
  return {
    float = {
      show_header = false,
      source = 'if_many',
      border = 'single'
    },
    severity_sort = true,
    signs = {
      severity = {
        min = vim.diagnostic.severity.WARN
      }
    },
    update_in_insert = false,
    underline = false,
    virtual_text = {
      spacing = 2,
      severity = {
        min = vim.diagnostic.severity.WARN
      }
    }
  }
end

return M
