-- Auto-expansion including tags.
vim.b.pear_tree_pairs = {
  ["<%"] = {
    ["closer"] = " %>",
  },
  ["<*>"] = {
    ["closer"] = "</*>",
    ["not_if"] = { "br", "hr", "img" },
    ["not_like"] = "/$",
    ["until"] = "[^a-zA-Z0-9-._]",
  },
}

vim.opt_local.matchpairs = "(:),{:},[:]"
