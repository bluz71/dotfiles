local opt_local = vim.opt_local

vim.b.pear_tree_pairs = {
  ["<*>"] = {
    ["closer"] = "</*>",
    ["not_if"] = { "br", "hr", "img" },
    ["not_like"] = "/$",
    ["until"] = "[^a-zA-Z0-9-._]",
  },
}

opt_local.formatoptions = "tcqj"
opt_local.shiftwidth = 2
