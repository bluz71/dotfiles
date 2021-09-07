local pears = require('pears')
local R = require('pears.rule')

pears.setup(function(conf)
  conf.pair('{', {
    close = '}',
    should_expand = R.match_next('$')
  })
  conf.pair('[', {
    close = ']',
    should_expand = R.match_next('$')
  })
  conf.pair('(', {
    close = ')',
    should_expand = R.match_next('$')
  })
  conf.pair('"', {
    close = '"',
    should_expand = R.match_next('$')
  })
  conf.pair('"""', nil)
  conf.pair("'", {
    close = "'",
    should_expand = R.match_next('$')
  })
  conf.pair("'''", nil)
  conf.pair('`', {
    close = '`',
    should_expand = R.match_next('$')
  })
  conf.pair('```', {
    close = '```',
    filetypes = {'markdown'},
    should_expand = R.match_next('$')
  })
  conf.pair('<%', {
    close = '%>',
    filetypes = {'eruby'}
  })
  conf.pair('|', {
    close = '|',
    filetypes = {'ruby'},
    should_expand = R.match_next("$")
  })
  conf.expand_on_enter(false)
  conf.remove_pair_on_inner_backspace(false)
  conf.remove_pair_on_outer_backspace(false)
  conf.preset('tag_matching')
  conf.disabled_filetypes({'text', ''})
end)
