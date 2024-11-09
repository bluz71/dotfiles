local colorizer = require("colorizer")

colorizer.setup({
  filetypes = {
    "css",
    eruby = {
      mode = "virtualtext", names = true, tailwind = true, virtualtext_inline = true,
    },
    html = {
      mode = "virtualtext", names = true, tailwind = true, virtualtext_inline = true,
    },
    "lua", "markdown", "text", "tmux", "toml", "txt", "vim", "yaml",
  },
  user_default_options = {
    mode = "background",
    names = false,
    virtualtext = "▮",
  },
})
