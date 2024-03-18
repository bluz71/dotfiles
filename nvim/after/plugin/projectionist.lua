local fn = vim.fn
local g = vim.g
local map = vim.keymap.set

if fn.filereadable("config/routes.rb") ~= 0 then
  -- This looks like a Rails project.
  g.projectionist_heuristics = {
    ["config/routes.rb"] = {
      ["app/views/*.json.jbuilder"] = {
        ["type"] = "builder",
        ["alternate"] = "app/controllers/{dirname}_controller.rb",
      },
      ["app/controllers/*_controller.rb"] = {
        ["type"] = "controller",
        ["alternate"] = "app/models/{singular}.rb",
      },
      ["app/javascript/*.js"] = {
        ["type"] = "javascript",
      },
      ["app/models/*.rb"] = {
        ["type"] = "model",
        ["alternate"] = "app/controllers/{plural}_controller.rb",
      },
      ["spec/*.rb"] = {
        ["type"] = "spec",
      },
      ["app/views/*.html.erb"] = {
        ["type"] = "view",
        ["alternate"] = "app/controllers/{dirname}_controller.rb",
      },
    },
  }

  map("n", "<Leader>a", ":A<CR>")
  map("n", "<Leader>eb", ":Ebuilder<Space>")
  map("n", "<Leader>ec", ":Econtroller<Space>")
  map("n", "<Leader>ej", ":Ejavascript<Space>")
  map("n", "<Leader>em", ":Emodel<Space>")
  map("n", "<Leader>et", ":Espec<Space>")
  map("n", "<Leader>ev", ":Eview<Space>")
elseif fn.filereadable("src/index.js") ~= 0 then
  -- This looks like a React project.
  g.projectionist_heuristics = {
    ["src/App.js"] = {
      ["src/components/*.js"] = {
        ["type"] = "component",
        ["alternate"] = "src/__tests__/components/{}.test.js",
      },
      ["src/__tests__/components/*.test.js"] = {
        ["type"] = "test",
        ["alternate"] = "src/components/{}.js",
      },
    },
  }

  map("n", "<Leader>a", ":A<CR>")
  map("n", "<Leader>ec", ":Ecomponent<Space>")
  map("n", "<Leader>et", ":Etest<Space>")
end
