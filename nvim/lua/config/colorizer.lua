local colorizer = require("colorizer")

colorizer.setup({
  filetypes = {
    "css", "html", "lua", "markdown", "scss", "text", "toml", "txt", "vim", "yaml",
  },
  user_default_options = {
    tailwind = "both",
    names = false,
  },
})
