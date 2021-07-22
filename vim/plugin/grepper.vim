let g:grepper = {}
let g:grepper.tools = ['rg']
let g:grepper.jump = 1

" Search for user-supplied term.
nnoremap <Leader>/ :GrepperRg<Space>
" Search for current word or selection.
nnoremap g/ :Grepper -cword -noprompt<CR>
xmap g/ <Plug>(GrepperOperator)
