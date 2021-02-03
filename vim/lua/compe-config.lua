local compe = require'compe'

compe.setup {
  enabled = true,
  min_length = 2,
  preselect = 'disable',

  source = {
    buffer = {
      filetypes = {'eruby', 'dart', 'html', 'javascript', 'json'}
    },
    nvim_lsp = {
      filetypes = {'dart', 'eruby', 'html', 'javascript'}
    },
    vsnip = {
      filetypes = {'dart', 'html', 'javascript', 'markdown'}
    }
  }
}
