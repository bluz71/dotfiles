" Open directory tree path.
"
function! tree#Open() abort
    let path = expand('%:p')
    if !isdirectory(path)
        return
    endif
    execute 'Fern ' . fnameescape(path)
endfunction
