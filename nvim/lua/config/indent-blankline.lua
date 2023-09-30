local ibl = require("ibl")
local buffer = require("util.buffer")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

ibl.setup({
  exclude = {
    filetypes = { "cheat40", "text", "txt", "undotree", "yaml" },
  },
  indent = {
    char = { "▏" },
    tab_char = { "▏" },
  },
  scope = {
    enabled = false,
  },
})

-- Disable indent-blankline for files larger than 100K in size.
autocmd("BufEnter", {
  callback = function()
    if buffer.is_large(0) then
      vim.cmd([[IBLDisable]])
    end
  end,
  group = augroup("IBLPluginEvents", {})
})
