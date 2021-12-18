local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = {
    'bash', 'c', 'cpp', 'css', 'go', 'html', 'java', 'javascript',
    'lua', 'python', 'ruby', 'rust', 'scss', 'toml', 'typescript', 'vue'
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = {'ruby', 'yaml'}
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ['am'] = '@function.outer',
        ['im'] = '@function.inner',
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
