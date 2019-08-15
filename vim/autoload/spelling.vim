" Toggle spelling mode, add the dictionary to the completion list of
" sources if spelling mode has been entered, otherwise remove it.
"
function! spelling#Toggle() abort
    setlocal spell!
    if &spell
        set complete+=kspell
        echo "Spell mode enabled"
    else
        set complete-=kspell
        echo "Spell mode disabled"
    endif
endfunction
