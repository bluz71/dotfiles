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


" Plugins to disable when running in diff mode.
"
function! diff#DisablePlugins() abort
    if &diff
        :GitGutterDisable
        if has('nvim')
            :IndentBlanklineDisable!
        endif
    endif
endfunction
