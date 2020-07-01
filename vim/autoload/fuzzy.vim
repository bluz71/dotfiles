" Return the source list of open buffers for the custom :BDelete command.
"
function! fuzzy#ListBuffers() abort
    redir => list
    silent ls
    redir END
    return split(list, "\n")
endfunction
