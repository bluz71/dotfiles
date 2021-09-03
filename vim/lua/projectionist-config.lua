local g = vim.g
local map = vim.api.nvim_set_keymap
local opts = {noremap = true}

if vim.fn.filereadable('config/routes.rb') ~= 0 then
  -- This looks like a Rails project.
  g.projectionist_heuristics = {
    ['config/routes.rb'] = {
      ['app/views/*.json.jbuilder'] = {
        ['type'] = 'builder',
        ['alternate'] = 'app/controllers/{dirname}_controller.rb',
      },
      ['app/controllers/*_controller.rb'] = {
        ['type'] = 'controller',
        ['alternate'] = 'app/models/{singular}.rb',
      },
      ['app/helpers/*_helper.rb'] = {
        ['type'] = 'helper',
        ['alternate'] = 'app/controllers/{}_controller.rb',
      },
      ['config/initializers/*.rb'] = {
        ['type'] = 'initializer',
      },
      ['app/javascript/*.js'] = {
        ['type'] = 'javascript',
      },
      ['app/models/*.rb'] = {
        ['type'] = 'model',
        ['alternate'] = 'app/controllers/{plural}_controller.rb',
      },
      ['app/javascript/stylesheets/*.scss'] = {
        ['type'] = 'stylesheets',
      },
      ['spec/*.rb'] = {
        ['type'] = 'spec',
      },
      ['app/views/*.html.erb'] = {
        ['type'] = 'view',
        ['alternate'] = 'app/controllers/{dirname}_controller.rb',
      }
    }
  }

  map('n', '<Leader>a', ':A<CR>', opts)
  map('n', '<Leader>eb', ':Ebuilder<Space>', opts)
  map('n', '<Leader>ec', ':Econtroller<Space>', opts)
  map('n', '<Leader>eh', ':Ehelper<Space>', opts)
  map('n', '<Leader>ei', ':Einitializer<Space>', opts)
  map('n', '<Leader>ej', ':Ejavascript<Space>', opts)
  map('n', '<Leader>em', ':Emodel<Space>', opts)
  map('n', '<Leader>es', ':Estylesheets<Space>', opts)
  map('n', '<Leader>et', ':Espec<Space>', opts)
  map('n', '<Leader>ev', ':Eview<Space>', opts)
elseif vim.fn.filereadable('src/index.js') ~= 0 then
  -- This looks like a React project.
  g.projectionist_heuristics = {
    ['src/App.js'] = {
      ['src/components/*.js'] = {
        ['type'] = 'component',
        ['alternate'] = 'src/__tests__/components/{}.test.js',
      },
      ['src/__tests__/components/*.test.js'] = {
        ['type'] = 'test',
        ['alternate'] = 'src/components/{}.js',
      },
      ['src/styles/*.css'] = {
        ['type'] = 'stylesheet',
        ['alternate'] = 'src/components/{}.js',
      }
    }
  }

  map('n', '<Leader>a', ':A<CR>', opts)
  map('n', '<Leader>ec', ':Ecomponent<Space>', opts)
  map('n', '<Leader>es', ':Estylesheet<Space>', opts)
  map('n', '<Leader>et', ':Etest<Space>', opts)
end
