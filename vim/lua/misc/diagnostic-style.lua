local M = {}

M.config = function()
  if vim.fn.has('nvim-0.6') == 1 then
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
  else
    return {
      severity_sort = true,
      signs = {
        severity_limit = 'Warning',
      },
      update_in_insert = false,
      underline = false,
      virtual_text = {
        spacing = 2,
        severity_limit = 'Warning',
      }
    }
  end
end

return M
