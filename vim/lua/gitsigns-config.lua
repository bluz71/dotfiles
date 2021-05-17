local gitsigns = require'gitsigns'

gitsigns.setup {
  signs = {
    add = {hl = 'GitSignsAdd', text = '▌'},
    change = {hl = 'GitSignsChange', text = '▌'},
    delete = {hl = 'GitSignsDelete', text = '◢'},
    topdelete = {hl = 'GitSignsDelete', text = '◥'},
    changedelete = {hl = 'GitSignsChangeDelete', text = '▌'},
  },
  keymaps = {
    buffer = true,
    ['n ]g'] = '<cmd>lua require"gitsigns".next_hunk({wrap = true})<CR>zz',
    ['n [g'] = '<cmd>lua require"gitsigns".prev_hunk({wrap = true})<CR>zz',
    ['n <Space>+'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['n <Space>-'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['n <Space>p'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <Space>b'] = '<cmd>lua require"gitsigns".blame_line()<CR>',
    ['n <Space>r'] = '<cmd>lua require"gitsigns".refresh()<CR>',
  },
  max_file_length = 100000,
  sign_priority = 10
}
