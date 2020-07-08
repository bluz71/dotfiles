" Display relative line numbers in the active window and display absolute
" numbers in inactive windows.
"
" In newer versions of Vim, if `cursorlineopt` exists, then also toggle
" cursorline appropriately.
"
function! relative_number#Activity(mode) abort
    if &diff
        " For diffs, do nothing since we want relativenumbers in all windows.
        return
    endif
    if &buftype == "nofile" || &buftype == "nowrite" || &filetype == "help"
        setlocal nonumber
    elseif a:mode == "active"
        setlocal relativenumber
        if exists('&cursorlineopt')
            setlocal cursorline
        endif
    else
        setlocal norelativenumber
        if exists('&cursorlineopt')
            setlocal nocursorline
        endif
    endif
endfunction
