-- In the match it plugin ignore the <ul>, <ul> and <dl> special cases.
vim.cmd([[
  let b:match_words = '<:>,<\@<=\([^/][^ \t>]*\)[^>]*\%(>\|$\):<\@<=/\1>'
]])
