local indent_blankline = require("indent_blankline")

indent_blankline.init()

-- Disable this plugin when in diff mode.
local enable = true
if vim.opt.diff:get() then
  enable = false
end

indent_blankline.setup({
  enabled = enable,
  char = '▏',
  filetype_exclude = {'cheat40', 'fern', 'help', 'text', 'undotree', 'yaml'},
  show_first_indent_level = false,
  show_trailing_blankline_indent = false,
  use_treesitter = true
})
