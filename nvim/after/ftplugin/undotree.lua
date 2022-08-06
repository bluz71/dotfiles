local opt_local = vim.opt_local

opt_local.colorcolumn = "0"
if vim.fn.exists("&cursorlineopt") == 1 then
  opt_local.cursorlineopt = "both"
end
opt_local.matchpairs = ""
