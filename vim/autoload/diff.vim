" Style when running in diff mode.
"
function! diff#Styling() abort
    if &diff
        setlocal colorcolumn=0
        highlight MatchParen NONE
        wincmd l
    endif
endfunction
