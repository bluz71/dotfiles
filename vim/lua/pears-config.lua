local pears = require'pears'

pears.setup(function(conf)
  conf.pair('|', {
    close = '|',
    filetypes = {'ruby'}
  })
  conf.expand_on_enter(false)
  conf.remove_pair_on_inner_backspace(false)
  conf.remove_pair_on_outer_backspace(false)
  conf.preset('tag_matching')
  conf.disabled_filetypes({'text'})
end)
