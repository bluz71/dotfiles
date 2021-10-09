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
  mapping = {
    ['<C-y>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true
    })
    -- ['<Tab>'] = cmp.mapping.select_next_item({
    --   behavior = cmp.SelectBehavior.Insert
    -- }),
    -- ['<S-Tab>'] = cmp.mapping.select_prev_item({
    --   behavior = cmp.SelectBehavior.Insert
    -- })
  },
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  experimental = {
    native_menu = true
  }
})

vim.cmd [[
  augroup CmpPluginEvents
    autocmd!
    autocmd FileType dart,eruby,html,javascript,ruby lua require('cmp').setup.buffer({sources = {{name = 'buffer'},{name = "nvim_lsp"}}})
  augroup END
]]
