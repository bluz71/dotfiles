" Display color column in the active window and disable color columns in all
" inactive windows.
"
" Likewise, display relative line numbers in the active window and display
" absolute numbers in inactive windows.
"
" In newer versions of Vim, if `cursorlineopt` exists, then also toggle
" cursorline appropriately.
"
function! window_traits#Activity(active) abort
    if &diff
        " For diffs, do nothing since we want relativenumbers in all windows.
        return
    endif

    if a:active == v:true " Active window
        " Set cursorline for file explorers.
        if &buftype == "nofile"
            setlocal cursorline
            return
        endif

        set colorcolumn=81,82
        " Set relative numbering, except for help files.
        if &filetype != "help"
            setlocal relativenumber
        endif
        if exists('&cursorlineopt')
            setlocal cursorline
        endif
    else " Inactive window
        if &buftype == "nofile"
            setlocal nocursorline
            return
        endif

        setlocal colorcolumn=0
        setlocal norelativenumber
        if exists('&cursorlineopt')
            setlocal nocursorline
        endif
    endif
endfunction
