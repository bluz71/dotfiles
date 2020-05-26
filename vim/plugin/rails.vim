if filereadable('config/routes.rb')
    " This looks like a Rails app.
    nnoremap <Leader>a  :A<CR>
    nnoremap <Leader>ec :Econtroller<Space>
    nnoremap <Leader>eh :Ehelper<Space>
    nnoremap <Leader>em :Emodel<Space>
    nnoremap <Leader>es :Estylesheet<Space>
    nnoremap <Leader>et :Espec<Space>
    nnoremap <Leader>ev :Eview<Space>
endif
