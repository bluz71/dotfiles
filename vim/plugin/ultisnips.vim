let g:UltiSnipsExpandTrigger       = "<C-j>"
let g:UltiSnipsJumpForwardTrigger  = "<C-j>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

inoremap <silent> <C-j> <C-r>=LoadUltiSnips()<CR>

" UltiSnips is a slow plugin to load, hence, only load it up on demand via the
" expand trigger.
"
function! LoadUltiSnips()
    let l:curpos = getcurpos()
    execute plug#load('ultisnips')
    call cursor(l:curpos[1], l:curpos[2])
    call UltiSnips#ExpandSnippet()
    return ""
endfunction
