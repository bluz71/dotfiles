" Customizations when running in diff mode.
"
function! diff#Styling() abort
    if &diff
        setlocal colorcolumn=0
        :IndentLinesDisable
        :GitGutterDisable
        highlight! link Visual VisualInDiff
    endif
endfunction
