" Open directory tree path.
"
function! tree#Open() abort
    let l:path = expand('%:p')

    if !isdirectory(l:path)
        return
    endif

    execute 'Fern ' . fnameescape(path)
endfunction
