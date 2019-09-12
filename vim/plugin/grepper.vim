let g:grepper       = {}
let g:grepper.tools = ["rg"]
let g:grepper.jump  = 1
let g:grepper.stop  = 1000

" Search for user-supplied term.
nnoremap <Leader>/ :GrepperRg<Space>
" Search for current word or selection.
nnoremap gr :Grepper -cword -noprompt<CR>
xmap gr <plug>(GrepperOperator)