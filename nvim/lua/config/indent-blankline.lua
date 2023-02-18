local indent_blankline = require("indent_blankline")
local buffer = require("util.buffer")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

indent_blankline.setup({
  char = "▏",
  filetype_exclude = {
    "cheat40", "fern", "help", "packer", "text", "txt", "undotree", "yaml"
  },
  buftype_exclude = { "nofile", "terminal" },
  show_first_indent_level = true,
  show_foldtext = false,
  show_trailing_blankline_indent = false,
  use_treesitter = true,
})

-- Disable indent-blankline for files larger than 100K in size.
autocmd("BufEnter", {
  callback = function()
    if buffer.is_large(0) then
      require("indent_blankline.commands").disable()
    end
  end,
  group = augroup("ALEPluginEvents", {})
})
