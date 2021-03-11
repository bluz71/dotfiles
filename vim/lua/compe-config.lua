local compe = require'compe'

compe.setup {
  min_length = 2,
  preselect = 'disable',
  documentation = false,

  source = {
    buffer = {
      filetypes = {'dart', 'eruby', 'html', 'javascript', 'json', 'ruby'}
    },
    nvim_lsp = {
      filetypes = {'dart', 'eruby', 'html', 'javascript', 'ruby'}
    },
    vsnip = {
      filetypes = {'dart', 'html', 'javascript', 'markdown', 'ruby'}
    }
  }
}
