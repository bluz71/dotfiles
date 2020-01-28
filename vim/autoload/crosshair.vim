" Toggle crosshair.
"
function! crosshair#Toggle() abort
    if &cursorcolumn
        if exists('&cursorlineopt')
            set cursorlineopt=number
        endif
        set nocursorcolumn nocursorline
    else
        if exists('&cursorlineopt')
            set cursorlineopt=both
        endif
        set cursorcolumn cursorline
    endif
endfunction
