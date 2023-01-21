local opt_local = vim.opt_local

opt_local.number = false
opt_local.relativenumber = false
opt_local.signcolumn = "no"
if vim.fn.has("nvim-0.9") == 1 then
  opt_local.statuscolumn = nil
end
