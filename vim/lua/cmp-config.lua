local cmp = require('cmp')

cmp.setup({
  completion = {
    keyword_length = 2
  },
  documentation = false,
  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    })
  },
  snippet = {
    expand = function(args)
      vim.fn['vsnip#anonymous'](args.body)
    end
  }
})

vim.cmd [[
  augroup CmpEvents
    autocmd!
    autocmd FileType css,json,scss lua require('cmp').setup.buffer({sources = {{name = 'buffer'}}})
    autocmd FileType eruby lua require('cmp').setup.buffer({sources = {{name = 'buffer'},{name = "nvim_lsp"}}})
    autocmd FileType dart,html,javascript,ruby lua require('cmp').setup.buffer({sources = {{name = 'buffer'},{name = "nvim_lsp"},{name = "vsnip"}}})
  augroup END
]]
