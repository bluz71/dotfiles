local sign_get = vim.fn.sign_getdefined

-- Use the diagnostic symbols defined for the sign column.
local get_diagnostic_symbol = function(severity)
  return string.gsub(sign_get("DiagnosticSign" .. severity)[1].text, " ", "")
end

vim.g.linefly_options = {
  error_symbol = get_diagnostic_symbol("Error"),
  warning_symbol = get_diagnostic_symbol("Warn"),
  information_symbol = get_diagnostic_symbol("Info"),
  tabline = true,
  winbar = true,
  with_indent_status = true,
}
