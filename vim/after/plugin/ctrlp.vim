if filereadable('config/routes.rb')
    " This looks like a Rails app.
    noremap <localleader>ec :CtrlP app/controllers<CR>
    noremap <localleader>eh :CtrlP app/helpers<CR>
    noremap <localleader>em :CtrlP app/models<CR>
    noremap <localleader>es :CtrlP spec<CR>
    noremap <localleader>ev :CtrlP app/views<CR>
elseif filereadable('web/router.ex')
    " This looks like an Elixir/Phoenix app.
    noremap <localleader>ec :CtrlP web/controllers<CR>
    noremap <localleader>em :CtrlP web/models<CR>
    noremap <localleader>et :CtrlP test<CR>
    noremap <localleader>ev :CtrlP web/views<CR>
    noremap <localleader>ex :CtrlP web/templates<CR>
elseif filereadable('src/index.js')
    " This looks like a React app.
    noremap <localleader>ec :CtrlP src/components<CR>
    noremap <localleader>et :CtrlP src/__tests__/components<CR>
endif
