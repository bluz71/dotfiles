if filereadable('config/routes.rb')
    " This looks like a Rails app.
    noremap <localleader>ec :Files app/controllers<CR>
    noremap <localleader>eh :Files app/helpers<CR>
    noremap <localleader>em :Files app/models<CR>
    noremap <localleader>es :Files app/assets/stylesheets<CR>
    noremap <localleader>et :Files spec<CR>
    noremap <localleader>ev :Files app/views<CR>
elseif filereadable('web/router.ex')
    " This looks like an Elixir/Phoenix app.
    noremap <localleader>ec :Files web/controllers<CR>
    noremap <localleader>em :Files web/models<CR>
    noremap <localleader>et :Files test<CR>
    noremap <localleader>ev :Files web/views<CR>
    noremap <localleader>ex :Files web/templates<CR>
elseif filereadable('src/index.js')
    " This looks like a React app.
    noremap <localleader>ec :Files src/components<CR>
    noremap <localleader>es :Files src/styles<CR>
    noremap <localleader>et :Files src/__tests__/components<CR>
endif
