let g:nightflyCursorColor = 1
if system("uname") == "Darwin\n" && !has("gui_running")
    let g:nightflyUndercurls  = 0
endif
if has('nvim')
    let g:nightflyFloatingFZF = 1
endif
