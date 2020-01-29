let b:pear_tree_pairs = {
            \ '(':     {'closer': ')'},
            \ '[':     {'closer': ']'},
            \ '{':     {'closer': '}'},
            \ "'":     {'closer': "'"},
            \ '"':     {'closer': '"'},
            \ '`':     {'closer': '`'},
            \ '/\*\*': {'closer': '\*/'},
            \ '<*>':   {
            \            'closer':   '</*>',
            \            'not_if':   ['br', 'hr', 'img'],
            \            'not_like': '/$',
            \            'until':    '[^a-zA-Z0-9-._]'
            \          },
            \ }
setlocal formatoptions=cqj
