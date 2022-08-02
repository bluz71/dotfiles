local colorizer = require("colorizer")

colorizer.setup({ "css", "json", "lua", "markdown", "scss", "vim", "yaml" })

vim.keymap.set("n", "'c", ":ColorizerToggle<CR>", { silent = true })
