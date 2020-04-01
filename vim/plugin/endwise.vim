let g:endwise_no_mappings = 1

" Insert <CR> mapping that:
" - closes the popup menu if one is visible
" - adds a newline
" - does endwise processing
imap <expr> <CR> (pumvisible() ? "\<C-e>\<CR>\<Plug>DiscretionaryEnd" : "\<CR>\<Plug>DiscretionaryEnd")
