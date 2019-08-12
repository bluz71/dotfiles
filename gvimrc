" gvim specific settings.
"
set guicursor+=a:blinkon0
set guifontset=
" Disable menu.
set guioptions-=m
" Disable toolbar.
set guioptions-=T
" Disable right scrollbar.
set guioptions-=r
" Disable left scrollbar.
set guioptions-=L
" Disable GUI tab menu.
set guioptions-=e


" Set the size and font.
if &diff
    " Use double width for Vim diff.
    set columns=174
else
    set columns=87
endif
set lines=55
if has("gui_gtk2") || has("gui_gtk3")
    set guifont=Iosevka\ Custom\ 12
elseif has("gui_macvim")
    set guifont=Iosevka-Custom:h13
endif


" gvim specific functions.
"
fun! DoubleSizeAndVsplit()
    if &columns != 174
        set columns=174
        vsplit
        winpos 20 20
    else
        wincmd w
        close
        set columns=84
        winpos 20 20
    endif
endfun


" gvim specific keyboard mappings.
"
map <Space>2 :call DoubleSizeAndVsplit()<CR>
