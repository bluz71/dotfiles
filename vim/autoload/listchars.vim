let s:listMode = 1

" Toggle the highlighting of special characters.
"
function! listchars#Toggle() abort
    if s:listMode == 1
        " Brighten extended list characters.
        setlocal listchars=eol:$,tab:>-,trail:-
        highlight! link NonText WarningMsg 
        if has("nvim")
            highlight! link Whitespace WarningMsg
            :IndentBlanklineDisable
        else
            highlight! link SpecialKey WarningMsg
            setlocal list
        endif
        let s:listMode = 0
    else
        " Dim shortened list characters.
        setlocal listchars=tab:\ \ ,trail:-
        highlight! link NonText LineNr
        if has("nvim")
            highlight! link Whitespace Conceal
            :IndentBlanklineEnable
        else
            highlight! link SpecialKey Conceal
            setlocal nolist
        endif
        let s:listMode = 1
    endif
endfunction
