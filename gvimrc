" gvim specific settings.
"
set guifontset=
" Disable menu.
set guioptions-=m
" Disable toolbar.
set guioptions-=T
" Disable right scrollbar.
set guioptions-=r
" Disable left scrollbar.
set guioptions-=L
" Enable console dialogs.
set guioptions+=c
" Disable beeps and flashes.
set visualbell t_vb=


" Set the size and font.
if &diff
    " Use double width for Vim diff.
    set columns=174
else
    set columns=87
endif
set lines=65
if has("gui_gtk2")
    set guifont=Inconsolata\ 10.5
elseif has("gui_macvim")
    set guifont=Menlo\ Regular:h12
elseif has("win32")
    set guifont=Consolas:h11
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
map <A-t> :tabnew<CR>
map <A-w> :tabclose<CR>
map <leader>2 :call DoubleSizeAndVsplit()<CR>
