" Open directory path.
"
function! directory#Open() abort
    let path = expand('%:p')
    if !isdirectory(path)
        return
    endif
    execute 'Fern ' . fnameescape(path)
endfunction
