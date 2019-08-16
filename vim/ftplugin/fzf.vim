if has("nvim")
    " Escape inside a FZF terminal window should exit the terminal window rather
    " than going into the terminal's normal mode.
    tnoremap <buffer> <Esc> <Esc>
endif
