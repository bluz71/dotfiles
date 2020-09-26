local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {
    'c', 'c_sharp', 'cpp', 'dart', 'go', 'html', 'java', 'javascript', 'json',
    'lua', 'python', 'ruby', 'rust', 'typescript'
  },
  highlight = {
    enable = true
  }
}
