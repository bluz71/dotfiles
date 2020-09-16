function! location_list#Toggle() abort
    if get(getloclist(0, {'winid' : 0}), 'winid', 0) > 0
        " We have an open location list, so close it.
        silent lclose
    else
        " We don't have a location list, so open it.
        silent lopen
    endif
endfunction
