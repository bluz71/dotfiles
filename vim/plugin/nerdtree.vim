let g:NERDTreeDirArrowExpandable  = "▷"
let g:NERDTreeDirArrowCollapsible = "◢"
let NERDTreeHijackNetrw           = 0
let NERDTreeIgnore                = ['^node_modules$[[dir]]']
let NERDTreeMinimalUI             = 1
let NERDTreeStatusline            = " NERDTree "

noremap <silent> <Leader>n :NERDTreeToggle<CR> <C-w>=
noremap <silent> <Leader>f :NERDTreeFind<CR>   <C-w>=

" Automatically refresh NERDTree.

function! s:NERDTreeRefreshUponEnter()
    if &filetype == "nerdtree"
        silent execute 'normal R'
    endif
endfunction

function! s:NERDTreeRefreshAfterWrite()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeFocus | silent execute 'normal R' | wincmd p
    endif
endfunction

augroup CustomNERDTreeAutocmds
    autocmd!
    autocmd BufEnter     * call s:NERDTreeRefreshUponEnter()
    autocmd BufWritePost * call s:NERDTreeRefreshAfterWrite()
augroup END
