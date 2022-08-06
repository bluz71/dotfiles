local opt_local = vim.opt_local

vim.b.pear_tree_pairs = {
  ["("] = { ["closer"] = ")" },
  ["["] = { ["closer"] = "]" },
  ["{"] = { ["closer"] = "}" },
  ["'"] = { ["closer"] = "'" },
}

opt_local.formatoptions = "tcqj"
opt_local.shiftwidth = 4
