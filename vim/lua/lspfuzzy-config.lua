local lspfuzzy = require('lspfuzzy')

lspfuzzy.setup({
  methods = {
    'textDocument/documentSymbol', 'textDocument/references',
    'workspace/symbol'
  },
  jump_one = false
})
