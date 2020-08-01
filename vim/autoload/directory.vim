" Open directory path.
"
function! directory#Open() abort
    let path = expand('%:p')
    if !isdirectory(path)
        return
    endif
    bwipeout %
    execute 'Fern ' . fnameescape(path)
endfunction
