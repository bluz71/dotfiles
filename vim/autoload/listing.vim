let s:listMode = 1

" Toggle the highlighting of special characters.
"
function! listing#Toggle() abort
    if &filetype == "go"
        if s:listMode == 1
            set listchars=eol:$,tab:>-,trail:-
            highlight! link SpecialKey Function
            highlight! link Whitespace Function
            let s:listMode = 0
        else
            " Mimic indentLine plugin markers for tab-indented Go code.
            set listchars=tab:\┊\ ,trail:-
            highlight! link SpecialKey Conceal
            highlight! link Whitespace Conceal
            let s:listMode = 1
        endif
        return
    endif

    " Note, Neovim has a Whitespace highlight group, Vim does not.
    if has("nvim")
        if s:listMode == 1
            set listchars=eol:$,tab:>-,trail:-
            highlight! link Whitespace Function
            let s:listMode = 0
        else
            set listchars=tab:\ \ ,trail:-
            highlight! link Whitespace Conceal
            let s:listMode = 1
        endif
    else
        set list!
    endif
endfunction
