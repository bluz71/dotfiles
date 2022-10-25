local colorizer = require("colorizer")

colorizer.setup({
  filetypes = { "css", "lua", "markdown", "scss", "vim", "yaml" },
  user_default_options = {
    names = false,
  }
})

vim.keymap.set("n", "'c", ":ColorizerToggle<CR>", { silent = true })
