" Toggle crosshair.
"
function! crosshair#Toggle() abort
    if &cursorcolumn
        if exists('&cursorlineopt')
            set cursorlineopt=number
        endif
        :IndentLinesEnable
        set nocursorcolumn nocursorline
    else
        if exists('&cursorlineopt')
            set cursorlineopt=both
        endif
        :IndentLinesDisable
        set cursorcolumn cursorline
    endif
endfunction
