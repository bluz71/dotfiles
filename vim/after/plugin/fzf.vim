if filereadable('config/routes.rb')
    " This looks like a Rails app.
    nnoremap <silent> <localleader>ec :Files app/controllers<CR>
    nnoremap <silent> <localleader>eh :Files app/helpers<CR>
    nnoremap <silent> <localleader>em :Files app/models<CR>
    nnoremap <silent> <localleader>es :Files app/assets/stylesheets<CR>
    nnoremap <silent> <localleader>et :Files spec<CR>
    nnoremap <silent> <localleader>ev :Files app/views<CR>
elseif filereadable('src/index.js')
    " This looks like a React app.
    nnoremap <silent> <localleader>ec :Files src/components<CR>
    nnoremap <silent> <localleader>es :Files src/styles<CR>
    nnoremap <silent> <localleader>et :Files src/__tests__/components<CR>
endif
