let s:listMode = v:true

" Toggle the highlighting of special characters.
"
function! listchars#Toggle() abort
    if s:listMode == v:true
        " Brighten extended list characters.
        setlocal listchars=eol:$,tab:>-,trail:-
        highlight! link NonText WarningMsg 
        highlight! link SpecialKey WarningMsg
        setlocal list
        let s:listMode = v:false
    else
        " Dim shortened list characters.
        setlocal listchars=tab:\ \ ,trail:-
        highlight! link NonText LineNr
        highlight! link SpecialKey Conceal
        setlocal nolist
        let s:listMode = v:true
    endif
endfunction
