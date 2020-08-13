" Open directory tree path.
"
function! tree#Open() abort
    let path = expand('%:p')
    if !isdirectory(path)
        return
    endif
    execute 'Fern ' . fnameescape(path)
endfunction

" Reload directory tree.
"
function! tree#Reload() abort
    if &filetype == "fern"
        silent execute 'normal r'
    endif
endfunction
