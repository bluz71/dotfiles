local window_picker = require("window-picker")

window_picker.setup({
  selection_chars = "abcdefghjklmnopqrstuvwxyz",
  picker_config = {
    statusline_winbar_picker = {
      use_winbar = "always",
    },
  },
})
