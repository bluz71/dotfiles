if filereadable('config/routes.rb')
    " This looks like a Rails project.
    let g:projectionist_heuristics = {
     \  'config/routes.rb': {
     \    'app/views/*.json.jbuilder': {
     \      'type': 'builder',
     \      'alternate': 'app/controllers/{dirname}_controller.rb',
     \    },
     \    'app/controllers/*_controller.rb': {
     \      'type': 'controller',
     \      'alternate': 'app/models/{singular}.rb',
     \    },
     \    'app/helpers/*_helper.rb': {
     \      'type': 'helper',
     \      'alternate': 'app/controllers/{}_controller.rb',
     \    },
     \    'config/initializers/*.rb': {
     \      'type': 'initializer',
     \    },
     \    'app/javascript/*.js': {
     \      'type': 'javascript',
     \    },
     \    'app/models/*.rb': {
     \      'type': 'model',
     \      'alternate': 'app/controllers/{plural}_controller.rb',
     \    },
     \    'app/javascript/stylesheets/*.scss': {
     \      'type': 'stylesheets',
     \    },
     \    'spec/*.rb': {
     \      'type': 'spec',
     \    },
     \    'app/views/*.html.erb': {
     \      'type': 'view',
     \      'alternate': 'app/controllers/{dirname}_controller.rb',
     \    }
     \  }
     \}
    nnoremap <Leader>a  :A<CR>
    nnoremap <Leader>eb :Ebuilder<Space>
    nnoremap <Leader>ec :Econtroller<Space>
    nnoremap <Leader>eh :Ehelper<Space>
    nnoremap <Leader>ei :Einitializer<Space>
    nnoremap <Leader>ej :Ejavascript<Space>
    nnoremap <Leader>em :Emodel<Space>
    nnoremap <Leader>es :Estylesheets<Space>
    nnoremap <Leader>et :Espec<Space>
    nnoremap <Leader>ev :Eview<Space>
elseif filereadable('src/App.js')
    " This looks like a React project.
    let g:projectionist_heuristics = {
     \  'src/App.js': {
     \    'src/components/*.js': {
     \      'type': 'component',
     \      'alternate': 'src/__tests__/components/{}.test.js',
     \    },
     \    'src/__tests__/components/*.test.js': {
     \      'type': 'test',
     \      'alternate': 'src/components/{}.js',
     \    },
     \    'src/styles/*.css': {
     \      'type': 'stylesheet',
     \      'alternate': 'src/components/{}.js',
     \    }
     \  }
     \}
    nnoremap <Leader>a  :A<CR>
    nnoremap <Leader>ec :Ecomponent<Space>
    nnoremap <Leader>es :Estylesheet<Space>
    nnoremap <Leader>et :Etest<Space>
endif
