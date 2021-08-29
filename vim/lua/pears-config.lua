local pears = require('pears')
local R = require('pears.rule')

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
    -- Don't expand quote before/after an alphanumeric or before/after another
    -- quote.
    should_expand = R.all_of(
      R.not_(R.start_of_context('[%w"]')),
      R.not_(R.match_next('[%w"]'))
    )
  })
  conf.pair("'", {
    close = "'",
    -- Don't expand quote before/after an alphanumeric or before/after another
    -- quote.
    should_expand = R.all_of(
      R.not_(R.start_of_context("[%w']")),
      R.not_(R.match_next("[%w']"))
    )
  })
  conf.expand_on_enter(false)
  conf.remove_pair_on_inner_backspace(false)
  conf.remove_pair_on_outer_backspace(false)
  conf.preset('tag_matching')
  conf.disabled_filetypes({'text', ''})
end)
