let g:fern#disable_default_mappings             = 1
let g:fern#disable_drawer_auto_quit             = 1
let g:fern#disable_viewer_hide_cursor           = 1
let g:fern#mark_symbol                          = '●'
let g:fern#renderer#default#collapsed_symbol    = '▷ '
if empty(eval('$VTE_VERSION'))
    let g:fern#renderer#default#expanded_symbol = '◢ '
else
    let g:fern#renderer#default#expanded_symbol = '▼ '
endif
let g:fern#renderer#default#leading             = ' '
let g:fern#renderer#default#leaf_symbol         = ' '
let g:fern#renderer#default#root_symbol         = '~ '

noremap <silent> <Leader>d :Fern . -drawer -width=35 -toggle<CR><C-w>=
noremap <silent> <Leader>f :Fern . -drawer -reveal=% -width=35<CR><C-w>=
noremap <silent> <Leader>. :Fern %:h -drawer -width=35<CR><C-w>=

" Disable Netrw.
let g:loaded_netrw             = 1
let g:loaded_netrwPlugin       = 1
let g:loaded_netrwSettings     = 1
let g:loaded_netrwFileHandlers = 1

augroup FernEvents
    autocmd!
    " Let fern handle directory paths instead of Netrw.
    autocmd BufEnter * ++nested call tree#Open()
augroup END
