local compe = require'compe'

compe.setup {
  enabled = true,
  debug = false,
  min_length = 2,

  source = {
    buffer = {
      filetypes = {'eruby', 'dart', 'html', 'javascript', 'json'}
    },
    vsnip = {
      filetypes = {'dart', 'html', 'javascript', 'markdown'}
    },
    nvim_lsp = {
      filetypes = {'dart', 'javascript'}
    }
  }
}
