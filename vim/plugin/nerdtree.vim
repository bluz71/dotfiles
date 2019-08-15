let g:NERDTreeDirArrowExpandable  = "▷"
let g:NERDTreeDirArrowCollapsible = "◢"
let NERDTreeHijackNetrw           = 0
let NERDTreeStatusline            = " NERDTree "

noremap <silent> <Leader>n :NERDTreeToggle<CR> <C-w>=
noremap <silent> <Leader>f :NERDTreeFind<CR> <C-w>=

" Upon entering the NERDTree window do a root directoy refresh to automatically
" pick up any file or directory changes.
"
function! s:nerdtreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

augroup nerdtreeEvents
    autocmd!
    autocmd BufEnter * call s:nerdtreeRefresh()
augroup END
