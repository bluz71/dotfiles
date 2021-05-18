local pears = require'pears'
local R = require'pears.rule'

pears.setup(function(conf)
  conf.pair('<%', {
    close = '%>',
    filetypes = {'eruby'}
  })
  conf.pair('|', {
    close = '|',
    filetypes = {'ruby'}
  })
  conf.pair('"', {
    close = '"',
    filetypes = {
      exclude = {'vim'}
    },
    should_expand = R.not_(R.start_of_context '[a-zA-Z]')
  })
  conf.expand_on_enter(false)
  conf.remove_pair_on_inner_backspace(false)
  conf.remove_pair_on_outer_backspace(false)
  conf.preset('tag_matching')
  conf.disabled_filetypes({'text'})
end)
