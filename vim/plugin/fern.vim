let g:fern#disable_default_mappings             = 1
let g:fern#renderer#default#collapsed_symbol    = '▷ '
if empty(eval('$VTE_VERSION'))
    let g:fern#renderer#default#expanded_symbol = '◢ '
else
    let g:fern#renderer#default#expanded_symbol = '▼ '
endif
let g:fern#renderer#default#leading             = ' '
let g:fern#renderer#default#leaf_symbol         = ' '
let g:fern#renderer#default#marked_symbol       = '●'
let g:fern#renderer#default#root_symbol         = '~ '
let g:fern#renderer#default#unmarked_symbol     = ''

noremap <silent> <Leader>d :Fern . -drawer -width=35 -toggle<CR><C-w>=
noremap <silent> <Leader>f :Fern . -drawer -reveal=% -width=35<CR><C-w>=
noremap <silent> <Leader>. :Fern %:h -drawer -width=35<CR><C-w>=
