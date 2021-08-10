local telescope = require('telescope')

telescope.setup({
  defaults = {
    layout_config = {
      prompt_position = 'top'
    },
    sorting_strategy = 'ascending'
  }
})
