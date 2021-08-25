let g:nightflyCursorColor = 1
let g:nightflyNormalFloat = 1
if empty(eval('$VTE_VERSION')) && !has('gui_running')
    " Alacritty and iTerm2 terminals don't currently support coloured undercurls
    " whilst VTE-based terminals, such as GNOME Terminal, do.
    let g:nightflyUndercurls = 0
endif
