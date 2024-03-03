local colorizer = require("colorizer")

colorizer.setup({
  filetypes = {
    "astro", "css", "html", "lua", "markdown", "scss", "text", "toml", "txt", "vim", "yaml",
  },
  user_default_options = {
    tailwind = "both",
    names = false,
  },
})

vim.keymap.set("n", "'c", ":ColorizerToggle<CR>", { silent = true })
