local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  ensure_installed = {
    'c', 'cpp', 'dart', 'go', 'html', 'java', 'javascript', 'lua', 'php',
    'python', 'ruby', 'rust', 'typescript', 'vue'
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { 'dart' }
  }
})
