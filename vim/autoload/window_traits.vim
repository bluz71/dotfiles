" Display color column in the active window and disable color columns in all
" inactive windows.
"
" Display relative line numbers in the active window and display absolute
" numbers in inactive windows.
"
" In newer versions of Vim, if `cursorlineopt` exists, then also toggle
" cursorline appropriately.
"
function! window_traits#Activity(mode) abort
    if &diff
        " For diffs, do nothing since we want relativenumbers in all windows.
        return
    endif
    if &filetype == "help"
        setlocal nonumber
    endif
    if &buftype == "nofile" || &buftype == "nowrite"
        setlocal colorcolumn=0
        setlocal nonumber
    elseif a:mode == "active"
        set colorcolumn=81,82
        setlocal relativenumber
        if exists('&cursorlineopt')
            setlocal cursorline
        endif
    else
        setlocal colorcolumn=0
        setlocal norelativenumber
        if exists('&cursorlineopt')
            setlocal nocursorline
        endif
    endif
endfunction
