if has("nvim")
    lua require'colorizer'.setup({'css', 'javascript', 'scss', 'vim'})

    nnoremap <silent> <Space>z :ColorizerToggle<CR>
endif
