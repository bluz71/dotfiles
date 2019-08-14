" Return true if the preview window exists, otherwise return false.
"
function! preview#exists() abort
    for winnum in range(1, winnr('$'))
        if getwinvar(winnum, '&previewwindow')
            return 1
        endif
    endfor
    return 0
endfunction
