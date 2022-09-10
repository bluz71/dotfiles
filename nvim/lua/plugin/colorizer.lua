local colorizer = require("colorizer")

colorizer.setup({
  filetypes = { "css", "markdown", "scss", "vim" },
  user_default_options = {
    names = false,
  }
})

vim.keymap.set("n", "'c", ":ColorizerToggle<CR>", { silent = true })
