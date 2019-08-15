if has("nvim")
    let test#strategy = "neovim"
else
    let test#strategy = "vimterminal"
endif
let test#javascript#jest#executable = 'CI=true yarn test --colors'

nnoremap <silent> <Space>tf :TestFile<CR>
nnoremap <silent> <Space>tl :TestLast<CR>
nnoremap <silent> <Space>ts :TestSuite<CR>
nnoremap <silent> <Space>tt :TestNearest<CR>
