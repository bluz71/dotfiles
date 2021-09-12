treesitter_config = require'nvim-treesitter.configs'

treesitter_config.setup {
  textsubjects = {
    enable = true,
    keymaps = {
      ['.'] = 'textsubjects-smart',
      [';'] = 'textsubjects-container-outer',
    }
  }
}
