let g:fern#disable_default_mappings = 1
let g:fern#disable_drawer_smart_quit = 1
let g:fern#mark_symbol = '●'
let g:fern#renderer#default#collapsed_symbol = '▷ '
let g:fern#renderer#default#expanded_symbol = '◢ '
let g:fern#renderer#default#leading = ' '
let g:fern#renderer#default#leaf_symbol = ' '
let g:fern#renderer#default#root_symbol = '~ '

noremap <silent> <Leader>d :Fern . -drawer -width=35 -toggle<CR><C-w>=
noremap <silent> <Leader>f :Fern . -drawer -reveal=% -width=35<CR><C-w>=
noremap <silent> <Leader>. :Fern %:h -drawer -width=35<CR><C-w>=

" Open directory tree path.
"
function! FernDirectoryOpen() abort
    let l:path = expand('%:p')

    if !isdirectory(l:path)
        return
    endif

    execute 'Fern ' . fnameescape(path)
endfunction

augroup FernPluginEvents
    autocmd!
    " Let fern handle directory paths instead of Netrw.
    autocmd BufEnter * ++nested call FernDirectoryOpen()
augroup END
