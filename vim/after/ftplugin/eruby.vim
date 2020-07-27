setlocal formatoptions=cqj
setlocal matchpairs=(:),{:},[:]

" Auto-expansion including tags.
let b:pear_tree_pairs = {
            \ '(':   {'closer': ')'},
            \ '[':   {'closer': ']'},
            \ '{':   {'closer': '}'},
            \ '"':   {'closer': '"'},
            \ '<%':  {'closer': ' %>'},
            \ '<*>': {
            \          'closer':   '</*>',
            \          'not_if':   ['br', 'hr', 'img'],
            \          'not_like': '/$',
            \          'until':    '[^a-zA-Z0-9-._]'
            \        },
            \ }
