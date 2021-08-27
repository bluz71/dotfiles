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
  },
})

vim.cmd [[
  augroup CmpEvents
    autocmd!
    autocmd FileType dart,eruby,html,javascript,ruby lua require('cmp').setup.buffer({sources = {{name = 'buffer'},{name = "nvim_lsp"}}})
  augroup END
]]
