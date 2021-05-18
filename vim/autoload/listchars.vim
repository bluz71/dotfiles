let s:listMode = 1

" Toggle the highlighting of special characters.
"
function! listchars#Toggle() abort
    if s:listMode == 1
        setlocal listchars=eol:$,tab:>-,trail:-
        " Brighten list characters.
        if has("nvim")
            highlight! link Whitespace Function
            :IndentBlanklineDisable
        else
            highlight! link SpecialKey Function
        endif
        let s:listMode = 0
    else
        setlocal listchars=tab:\ \ ,trail:-
        " Dim list characters.
        if has("nvim")
            highlight! link Whitespace Conceal
            :IndentBlanklineEnable
        else
            highlight! link SpecialKey Conceal
        endif
        let s:listMode = 1
    endif
endfunction
