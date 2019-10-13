let g:UltiSnipsExpandTrigger       = "<C-j>"
let g:UltiSnipsJumpForwardTrigger  = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

inoremap <silent> <C-j> <C-r>=LoadUltiSnipsAndExpand()<CR>

" UltiSnips is a slow plugin to load, hence, only load it on demand once snippet
" expansion has been triggered.
"
function! LoadUltiSnipsAndExpand()
    let l:curpos = getcurpos()
    execute plug#load('ultisnips')
    call cursor(l:curpos[1], l:curpos[2])
    call UltiSnips#ExpandSnippet()
    return ""
endfunction
