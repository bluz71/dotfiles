if filereadable('config/routes.rb')
    " This looks like a Rails app.
    noremap <silent> <localleader>ec :Files app/controllers<CR>
    noremap <silent> <localleader>eh :Files app/helpers<CR>
    noremap <silent> <localleader>em :Files app/models<CR>
    noremap <silent> <localleader>es :Files app/assets/stylesheets<CR>
    noremap <silent> <localleader>et :Files spec<CR>
    noremap <silent> <localleader>ev :Files app/views<CR>
elseif filereadable('web/router.ex')
    " This looks like an Elixir/Phoenix app.
    noremap <silent> <localleader>ec :Files web/controllers<CR>
    noremap <silent> <localleader>em :Files web/models<CR>
    noremap <silent> <localleader>et :Files test<CR>
    noremap <silent> <localleader>ev :Files web/views<CR>
    noremap <silent> <localleader>ex :Files web/templates<CR>
elseif filereadable('src/index.js')
    " This looks like a React app.
    noremap <silent> <localleader>ec :Files src/components<CR>
    noremap <silent> <localleader>es :Files src/styles<CR>
    noremap <silent> <localleader>et :Files src/__tests__/components<CR>
endif
