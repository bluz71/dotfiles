local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  buffer = 0,
  callback = function()
    require("neo-tree.events").fire_event("git_event")
  end,
  group = augroup("NeoTreeTypeEvents", {}),
})
