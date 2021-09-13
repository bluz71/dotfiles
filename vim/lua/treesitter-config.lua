local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  ensure_installed = {
    'bash', 'c', 'cpp', 'dart', 'go', 'html', 'java', 'javascript', 'lua',
    'python', 'ruby', 'rust', 'toml', 'typescript', 'vue', 'yaml'
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { 'dart' }
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true,
      goto_next_start = {
        [']m'] = '@function.outer'
      },
      goto_previous_start = {
        ['[m'] = '@function.outer'
      }
    }
  }
})
