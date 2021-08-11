local telescope = require('telescope')
local actions = require('telescope.actions')

-- Using delta as previewer:
--   https://github.com/nvim-telescope/telescope.nvim/issues/605
--   https://github.com/nvim-telescope/telescope.nvim/issues/609

telescope.setup({
  defaults = {
    layout_config = {
      height = 0.8,
      prompt_position = 'top',
      preview_width = 0.5,
      width = 0.9
    },
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      }
    },
    prompt_prefix = '❯ ',
    selection_caret = '▶ ',
    sorting_strategy = 'ascending',
  }
})
