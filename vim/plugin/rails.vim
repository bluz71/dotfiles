if filereadable('config/routes.rb')
    " This looks like a Rails app.
    nnoremap <leader>a  :A<CR>
    nnoremap <leader>ec :Econtroller<Space>
    nnoremap <leader>eh :Ehelper<Space>
    nnoremap <leader>ei :Einitializer<Space>
    nnoremap <leader>em :Emodel<Space>
    nnoremap <leader>es :Estylesheet<Space>
    nnoremap <leader>et :Espec<Space>
    nnoremap <leader>ev :Eview<Space>
endif
