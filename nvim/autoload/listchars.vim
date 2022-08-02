let s:listMode = v:true

" Toggle the highlighting of special characters.
"
function! listchars#Toggle() abort
    if s:listMode == v:true
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
        let s:listMode = v:false
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
        let s:listMode = v:true
    endif
endfunction
