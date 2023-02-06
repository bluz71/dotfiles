local snippy = require("snippy")

snippy.setup({
  mappings = {
    i = {
      ["<C-j>"] = "expand_or_advance",
      ["<C-k>"] = "previous",
    },
  },
})

-- Insert mode snippy completion mapping - '<Control-s>'
vim.keymap.set("i", "<C-s>", function()
  require('snippy').complete()
end, { silent = true })
