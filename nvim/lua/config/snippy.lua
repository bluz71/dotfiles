local snippy = require("snippy")
local map = vim.keymap.set

snippy.setup({
  mappings = {
    i = {
      ["<C-j>"] = "expand_or_advance",
      ["<C-k>"] = "previous",
    },
  },
})

-- Insert mode snippy completion mapping - '<Control-s>'
map("i", "<C-s>", function()
  require('snippy').complete()
end, { silent = true })
