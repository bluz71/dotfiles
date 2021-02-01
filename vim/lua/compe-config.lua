local compe = require'compe'

compe.setup {
  enabled = true,
  min_length = 2,
  preselect = 'disable',

  source = {
    buffer = {
      filetypes = {'eruby', 'dart', 'html', 'javascript', 'json', 'ruby'}
    },
    nvim_lsp = {
      filetypes = {'dart', 'eruby', 'html', 'javascript', 'ruby'}
    },
    vsnip = {
      filetypes = {'dart', 'html', 'javascript', 'markdown', 'ruby'}
    }
  }
}
