local treesitter = require'nvim-treesitter.configs'
treesitter.setup {
  ensure_installed = {
    'bash', 'c', 'c_sharp', 'cpp', 'dart', 'go', 'html', 'java', 'javascript',
    'json', 'lua', 'python', 'ruby', 'rust', 'toml', 'typescript'
  },
  highlight = {
    enable = true
  }
}
