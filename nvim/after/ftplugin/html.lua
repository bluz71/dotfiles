-- In the match it plugin ignore the <ul>, <ul> and <dl> special cases.
vim.b.match_words = "<:>,<\\@<=\\([^/][^ \\t>]*\\)[^>]*\\%(>\\|$\\):<\\@<=/\\1>"
