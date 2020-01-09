" Color scheme options loaded directly into ~/.vimrc BEFORE the colorscheme has
" been set.

let g:moonflyCursorColor = 1
if system("uname") == "Darwin\n" && !has("gui_running")
    let g:moonflyUndercurls  = 0
endif
if has('nvim')
    let g:moonflyFloatingFZF = 1
endif
