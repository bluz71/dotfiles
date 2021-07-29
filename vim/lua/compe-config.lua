local compe = require'compe'

compe.setup {
  min_length = 2,
  preselect = 'disable',
  documentation = false,

  source = {
    buffer = {
      filetypes = {
        'css', 'dart', 'eruby', 'html', 'javascript', 'json', 'ruby', 'scss'
      }
    },
    nvim_lsp = {
      filetypes = {'dart', 'eruby', 'html', 'javascript', 'ruby'}
    },
    vsnip = {
      filetypes = {'dart', 'html', 'javascript', 'markdown', 'ruby'}
    }
  }
}

local opts = {expr = true, noremap = true, silent = true}
vim.api.nvim_set_keymap('i', '<C-y>', "compe#confirm('<C-y>')", opts)
