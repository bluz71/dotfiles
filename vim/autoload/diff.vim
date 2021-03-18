" Style when running in diff mode.
"
function! diff#Styling() abort
    if &diff
        setlocal colorcolumn=0
        highlight MatchParen NONE
        highlight! link Visual VisualInDiff
        wincmd l
    endif
endfunction
