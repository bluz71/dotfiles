local fidget = require("fidget")

fidget.setup({
  text = {
    spinner = "dots",
  },
  sources = {
    ["null-ls"] = {
      ignore = true,
    },
  },
})
