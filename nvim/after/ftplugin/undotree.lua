local opt_local = vim.opt_local

vim.keymap.set("n", "<Esc>", ":UndotreeHide<CR>", { buffer = true, silent = true })

opt_local.colorcolumn = "0"
opt_local.cursorlineopt = "both"
opt_local.matchpairs = ""
