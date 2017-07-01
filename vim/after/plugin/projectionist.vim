let g:projectionist_heuristics = {
  \  "web/router.ex": {
  \    "web/controllers/*_controller.ex": {
  \      "type": "controller",
  \      "alternate": "test/controllers/{}_controller_test.exs",
  \      "template": "defmodule {project|basename|camelcase|capitalize}.{capitalize}Controller do\n  use {project|basename|camelcase|capitalize}.Web, :controller\nend"
  \    },
  \    "web/models/*.ex": {
  \      "type": "model",
  \      "alternate": "test/models/{}_test.exs",
  \      "template": "defmodule {project|basename|camelcase|capitalize}.{capitalize} do\n  use {project|basename|camelcase|capitalize}.Web, :model\nend"
  \    },
  \    "web/views/*_view.ex": {
  \      "type": "view",
  \      "alternate": "test/views/{}_view_test.exs",
  \      "template": "defmodule {project|basename|camelcase|capitalize}.{capitalize}View do\n  use {project|basename|camelcase|capitalize}.Web, :view\nend"
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
  \  }
  \}
