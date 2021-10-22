-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local cmp = require('cmp')

cmp.setup({
  documentation = {
    border = {'╭', '─', '╮', '│', '╯', '─', '╰', '│'},
    winhighlight = 'NormalFloat:NormalFloat,FloatBorder:FloatBorder'
  },
  formatting = {
    format = function(entry, vim_item)
      vim_item.menu = ({
        nvim_lsp = '[L]',
        vsnip = '[S]',
        buffer = '[B]'
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
    end,
    ['<C-f>'] = cmp.mapping.scroll_docs(10),
    ['<C-b>'] = cmp.mapping.scroll_docs(-10)
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
    autocmd FileType dart,eruby,html,javascript,ruby lua require('cmp').setup.buffer(
    \  {sources = {
    \    {name = 'nvim_lsp', keyword_length = 2, max_item_count = 10},
    \    {name = 'vsnip', keyword_length = 2, max_item_count = 5},
    \    {name = 'buffer', keyword_length = 4, max_item_count = 10},
    \  }
    \})
  augroup END
]]
