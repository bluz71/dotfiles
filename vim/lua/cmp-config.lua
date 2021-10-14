-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local cmp = require('cmp')

cmp.setup({
  completion = {
    keyword_length = 2
  },
  documentation = false,
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        buffer = '☰',
        nvim_lsp = '□',
        vsnip = '▽'
      })[entry.source.name]

      return vim_item
    end
  },
  mapping = {
    ['<C-e>'] = cmp.mapping.close(),
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    }),
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  }
})

vim.cmd [[
  augroup CmpPluginEvents
    autocmd!
    autocmd FileType dart,eruby,html,javascript,ruby lua require('cmp').setup.buffer({sources = {{name = 'buffer'},{name = "nvim_lsp"},{name = "vsnip"}}})
  augroup END
]]
