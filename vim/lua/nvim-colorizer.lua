local colorizer = require'colorizer'
colorizer.setup({'css', 'javascript', 'json', 'scss', 'vim'})

local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Space>z', ':ColorizerToggle<CR>', opts)
