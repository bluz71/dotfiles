-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local gitsigns = require('gitsigns')

gitsigns.setup({
  signs = {
    add = {hl = 'GitSignsAdd', text = '│'},
    change = {hl = 'GitSignsChange', text = '│'},
    delete = {hl = 'GitSignsDelete', text = '│'},
    topdelete = {hl = 'GitSignsDelete', text = '│'},
    changedelete = {hl = 'GitSignsChangeDelete', text = '┃'},
  },
  keymaps = {
    buffer = true,
    ['n ]g'] = '<cmd>lua require"gitsigns".next_hunk({wrap = true})<CR>zz',
    ['n [g'] = '<cmd>lua require"gitsigns".prev_hunk({wrap = true})<CR>zz',
    ["n '+"] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ["n '-"] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ["n 'p"] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ["n 'b"] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    ["n 'r"] = '<cmd>lua require"gitsigns".refresh()<CR>',
  },
  max_file_length = 100000,
  sign_priority = 6
})
