local colorizer = require('colorizer')

colorizer.setup({'css', 'json', 'lua', 'markdown', 'scss', 'vim', 'yaml'})

local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', "'c", ':ColorizerToggle<CR>', opts)
