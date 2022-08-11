let s:listcharsVisibility = v:true

" Toggle the highlighting of special characters.
"
function! listchars#Toggle() abort
    if s:listcharsVisibility == v:true
        " Brighten extended list characters.
        setlocal listchars=eol:$,tab:>-,trail:-
        highlight! link NonText WarningMsg 
        highlight! link SpecialKey WarningMsg
        setlocal list
        echo '(Brighten) ON'
        let s:listcharsVisibility = v:false
    else
        " Dim shortened list characters.
        setlocal listchars=tab:\ \ ,trail:-
        highlight! link NonText LineNr
        highlight! link SpecialKey Conceal
        setlocal nolist
        echo '(Brighten) OFF'
        let s:listcharsVisibility = v:true
    endif
endfunction
