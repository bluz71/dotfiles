if has('nvim')
    let test#strategy = 'neovim'
else
    let test#strategy = 'vimterminal'
endif
let test#javascript#jest#executable = 'CI=true yarn test --colors'

nnoremap <silent> 'tf :TestFile<CR>
nnoremap <silent> 'tl :TestLast<CR>
nnoremap <silent> 'ts :TestSuite<CR>
nnoremap <silent> 'tt :TestNearest<CR>
