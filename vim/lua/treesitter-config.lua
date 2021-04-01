local treesitter = require'nvim-treesitter.configs'

treesitter.setup {
  ensure_installed = {
    'c', 'cpp', 'dart', 'go', 'html', 'java', 'javascript', 'python', 'ruby',
    'rust', 'typescript'
  },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = true
  },
  indent = {
    enable = false
  }
}
