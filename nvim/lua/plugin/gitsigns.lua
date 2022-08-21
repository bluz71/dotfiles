-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local gitsigns = require("gitsigns")
local cmd = vim.cmd
local map = vim.keymap.set

gitsigns.setup({
  signs = {
    add = { hl = "GitSignsAdd", text = "▎" },
    change = { hl = "GitSignsChange", text = "▎" },
    delete = { hl = "GitSignsDelete", text = "▁" },
    topdelete = { hl = "GitSignsDelete", text = "▔" },
    changedelete = { hl = "GitSignsChangeDelete", text = "▍" },
  },
  on_attach = function()
    local gs = package.loaded.gitsigns

    map("n", "]g", function()
      gs.next_hunk()
      cmd([[normal zz]])
    end)
    map("n", "[g", function()
      gs.prev_hunk()
      cmd([[normal zz]])
    end)
    map('n', "'+", gs.stage_hunk)
    map('n', "'-", gs.reset_hunk)
    map("n", "'p", gs.preview_hunk)
    map('n', "'b", function()
      gs.blame_line({ full = true })
    end)
    map("n", "'r", gs.refresh)
  end,
  max_file_length = 100000,
  sign_priority = 6,
})
