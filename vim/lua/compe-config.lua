local compe = require'compe'

compe.setup {
  enabled = true,
  debug = false,
  min_length = 2,

  source = {
    buffer = {
      filetypes = {'css', 'eruby', 'dart', 'html', 'javascript', 'json', 'scss'}
    },
    vsnip = {
      filetypes = {'dart', 'html', 'javascript', 'markdown'}
    },
    nvim_lsp = {
      filetypes = {'css', 'dart', 'eruby', 'html', 'javascript', 'scss'}
    }
  }
}
