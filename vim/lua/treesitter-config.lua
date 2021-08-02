local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  ensure_installed = {
    'bash', 'c', 'cpp', 'dart', 'go', 'html', 'java', 'javascript', 'lua',
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
