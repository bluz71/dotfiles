local compe = require'compe'

compe.setup {
  enabled = true,
  debug = false,
  min_length = 3,

  source = {
    buffer = {
      filetypes = {'dart', 'html', 'javascript', 'json', 'ruby'}
    },
    vsnip = {
      filetypes = {'dart', 'html', 'javascript', 'markdown', 'ruby'}
    },
    nvim_lsp = {
      filetypes = {'dart', 'javascript', 'ruby'}
    }
  }
}
