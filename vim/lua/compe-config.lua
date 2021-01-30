local compe = require'compe'

compe.setup {
  enabled = true,
  min_length = 2,
  preselect = 'disable',

  source = {
    buffer = {
      filetypes = {
        'css', 'eruby', 'dart', 'html', 'javascript', 'json', 'scss'
      }
    },
    nvim_lsp = {
      filetypes = {'css', 'dart', 'eruby', 'html', 'javascript', 'scss'}
    },
    vsnip = {
      filetypes = {'dart', 'html', 'javascript', 'markdown'}
    }
  }
}
