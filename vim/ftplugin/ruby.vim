let b:pear_tree_pairs = {
            \ '(': {'closer': ')'},
            \ '[': {'closer': ']'},
            \ '{': {'closer': '}'},
            \ "'": {'closer': "'"},
            \ '"': {'closer': '"'},
            \ '|': {'closer': '|'}
            \ }
let g:endwise_no_mappings = 1
imap <expr> <CR> (pumvisible() ? "\<C-y>\<CR>\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd")
