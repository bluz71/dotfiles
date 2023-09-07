local devicons = require("nvim-web-devicons")

-- Replace devicons with circles.
devicons.setup({ default = true })
devicons.set_default_icon("●")
for _, icon in pairs(devicons.get_icons()) do
  icon.icon = "●"
end
