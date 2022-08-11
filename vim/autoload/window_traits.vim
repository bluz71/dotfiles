" Render active windows differently to inactive windows.
"
" In inactive windows disable the following traits: color column, relative line
" numbers and sign column.
"
function! window_traits#Activity(active) abort
    if &diff || &buftype ==# 'nofile'
        " Do nothing for diffs or 'nofile' buffer types.
        return
    endif

    if a:active == v:true " Active window
        setlocal colorcolumn=81,82
        if exists('&cursorlineopt')
            setlocal cursorline
        endif
        " Set relative numbering, except for help files.
        if &filetype !=# 'help'
            setlocal relativenumber
        endif
    else " Inactive window
        setlocal colorcolumn=0
        if exists('&cursorlineopt')
            setlocal nocursorline
        endif
        setlocal norelativenumber
    endif
endfunction
