if has("nvim")
    lua require'colorizer'.setup({'css', 'javascript', 'scss', 'vim'})

    nnoremap <silent> <Leader>c :ColorizerToggle<CR>
endif
