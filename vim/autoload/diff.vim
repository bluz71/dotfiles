" Customizations when running in diff mode.
"
function! diff#Styling() abort
    if &diff
        setlocal colorcolumn=0
        :GitGutterDisable
        :IndentBlanklineDisable!
        highlight! link Visual VisualInDiff
    endif
endfunction
