" Please see ~/dotfiles/vim/ftplugin/text.vim
let g:pear_tree_ft_disabled       = ['text']
let g:pear_tree_map_special_keys  = 0
let g:pear_tree_repeatable_expand = 0
let g:pear_tree_smart_backspace   = 1
let g:pear_tree_smart_closers     = 1
let g:pear_tree_smart_openers     = 1

" Insert <CR> mapping that:
" - autocloses the popup menu and adds a newline
" - does pear-tree processing
" - does endwise processing
imap <expr> <CR> (pumvisible() ? "\<C-e>\<CR>\<Plug>DiscretionaryEnd" : "\<Plug>(PearTreeExpand)\<Plug>DiscretionaryEnd")
