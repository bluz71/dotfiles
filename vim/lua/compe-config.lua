local compe = require'compe'

compe.setup {
  enabled = true,
  min_length = 2,
  preselect = 'disable',

  source = {
    buffer = {
      filetypes = {'dart', 'eruby', 'html', 'javascript', 'json', 'ruby'}
    },
    nvim_lsp = {
      filetypes = {'dart', 'eruby', 'html', 'javascript'}
    },
    vim_lsc = {
      filetypes = {'ruby'}
    },
    vsnip = {
      filetypes = {'dart', 'html', 'javascript', 'markdown', 'ruby'}
    }
  }
}
