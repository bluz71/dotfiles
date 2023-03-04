function! complete#Tab() abort
    let l:col = col('.') - 2
    if l:col < 0 || getline('.')[l:col] =~ '\s'
         " Insert an actual TAB character since the preceeding character is a
         " whitespace.
        return "\<Tab>"
    endif

    " Call Control-next.
    return "\<C-n>"
endfunction

function! complete#ShiftTab() abort
    let l:col = col('.') - 2
    if l:col < 0 || getline('.')[l:col] =~ '\s'
        " Do nothing.
        return ""
    endif

    " Call Control-previous.
    return "\<C-p>"
endfunction
