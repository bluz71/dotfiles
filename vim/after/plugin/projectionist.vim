let g:projectionist_heuristics = {
  \  "web/router.ex": {
  \    "web/controllers/*_controller.ex": {
  \      "type": "controller",
  \      "alternate": "test/controllers/{}_controller_test.exs",
  \    },
  \    "web/models/*.ex": {
  \      "type": "model",
  \      "alternate": "test/models/{}_test.exs",
  \    },
  \    "web/views/*_view.ex": {
  \      "type": "view",
  \      "alternate": "test/views/{}_view_test.exs",
  \    },
  \    "web/templates/*.html.eex": {
  \      "type": "template",
  \      "alternate": "web/views/{dirname|basename}_view.ex"
  \    },
  \    "web/channels/*_channel.ex": {
  \      "type": "channel",
  \      "alternate": "test/channels/{}_channel_test.exs"
  \    },
  \    "test/*_test.exs": {
  \      "type": "test",
  \      "alternate": "web/{}.ex",
  \    }
  \  },
  \  "src/index.js": {
  \    "src/components/*.js": {
  \      "type": "component",
  \      "alternate": "src/__tests__/components/{}.test.js"
  \    },
  \    "src/__tests__/components/*.test.js": {
  \      "type": "test",
  \      "alternate": "src/components/{}.js"
  \    }
  \  }
  \}
if filereadable('config/routes.rb')
    " This looks like a Rails app.
    nnoremap <leader>ec :Econtroller<Space>
    nnoremap <leader>eh :Ehelper<Space>
    nnoremap <leader>em :Emodel<Space>
    nnoremap <leader>es :Espec<Space>
    nnoremap <leader>ev :Eview<Space>
elseif filereadable('web/router.ex')
    " This looks like an Elixir/Phoenix app.
    nnoremap <leader>ec :Econtroller<Space>
    nnoremap <leader>em :Emodel<Space>
    nnoremap <leader>et :Etest<Space>
    nnoremap <leader>ev :Eview<Space>
    nnoremap <leader>ex :Etemplate<Space>
elseif filereadable('src/index.js')
    " This looks like a React app.
    nnoremap <leader>ec :Ecomponent<Space>
    nnoremap <leader>et :Etest<Space>
endif
