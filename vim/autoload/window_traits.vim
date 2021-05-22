" Render active windows differently to inactive windows.
"
" In inactive windows disable the following traits: color column, relative line
" numbers and sign column.
"
function! window_traits#Activity(active) abort
    if &diff
        " For diffs, do nothing since we want relativenumbers in all windows.
        return
    endif

    if a:active == v:true " Active window
        if &buftype ==# 'nofile'
            " Do not style 'nofile' buffer types.
            return
        endif

        set colorcolumn=81,82
        if exists('&cursorlineopt')
            setlocal cursorline
        endif
        " Set relative numbering, except for help files.
        if &filetype !=# 'help'
            setlocal relativenumber
        endif
        set signcolumn=number
    else " Inactive window
        if &buftype ==# 'nofile'
            " Do not style 'nofile' buffer types.
            return
        endif

        setlocal colorcolumn=0
        if exists('&cursorlineopt')
            setlocal nocursorline
        endif
        setlocal norelativenumber
        set signcolumn=no
    endif
endfunction
