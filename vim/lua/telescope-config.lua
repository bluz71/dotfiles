local telescope = require('telescope')
local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')
local actions = require('telescope.actions')

function telescope_git_bcommits(opts)
  opts = opts or {}
  opts.previewer = previewers.new_termopen_previewer({
    get_command = function(entry)
      return {'git', '-c', 'core.pager=delta', '-c', 'delta.pager=less -R', 'show', entry.value}
    end
  })

  builtin.git_bcommits(opts)
end

function telescope_git_status(opts)
  opts = opts or {}
  opts.previewer = previewers.new_termopen_previewer({
    get_command = function(entry)
      if entry.status == 'D ' then
        return {'git', 'show', 'HEAD:'..entry.value }
      elseif entry.status == '??' then
        return {'bat', '--style=plain', entry.value}
      end
      return {'git', '-c', 'core.pager=delta', '-c', 'delta.pager=less -R', 'diff', entry.value }
    end
  })

  -- Use icons that resemble the `git status` command line.
  opts.git_icons = {
    added = "A",
    changed = "M",
    copied = "C",
    deleted = "-",
    renamed = "R",
    unmerged = "U",
    untracked = "?",
  }

  builtin.git_status(opts)
end

telescope.setup({
  defaults = {
    layout_config = {
      height = 0.8,
      prompt_position = 'top',
      preview_width = 0.5,
      width = 0.9
    },
    mappings = {
      i = {
        ['<ESC>'] = actions.close,
        ['<PageUp>'] = actions.preview_scrolling_up,
        ['<PageDown>'] = actions.preview_scrolling_down,
        ['<C-q>'] = false,
        ['<A-q>'] = actions.smart_send_to_qflist + actions.open_qflist,
        ['<A-d>'] = require("telescope.actions").delete_buffer
      }
    },
    prompt_prefix = '❯ ',
    selection_caret = '▶ ',
    sorting_strategy = 'ascending',
  },
  pickers = {
    buffers = {
      show_all_buffers = true
    }
  }
})

telescope.load_extension('fzf')

-- Mappings.
local key_map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
key_map('n', '<Space><Space>', '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
key_map('n', '<Space>.', ':Telescope find_files cwd=<C-r>=expand("%:h")<CR><CR>', opts)
key_map('n', '<Space>,', '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
key_map('n', '<Space>c', '<cmd>lua telescope_git_bcommits()<CR>', opts)
key_map('n', '<Space>g', '<cmd>lua telescope_git_status()<CR>', opts)
key_map('n', '<Space>h', '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
key_map('n', '<Space>i', '<cmd>lua require("telescope.builtin").highlights()<CR>', opts)
key_map('n', '<Space>o', '<cmd>lua require("telescope.builtin").oldfiles()<CR>', opts)
key_map('n', '<Space>]', '<cmd>lua require("telescope.builtin").tags()<CR>', opts)
key_map('n', '<Space>/', ':Telescope grep_string search=', {noremap = true})
key_map('n', '<Space>r', '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
key_map('n', '<Space>w', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
key_map('n', '<Space>W', ':Telescope lsp_workspace_symbols query=', {noremap = true})

if vim.fn.filereadable('config/routes.rb') ~= 0 then
  key_map('n', '<Space>ec', ':Telescope find_files cwd=app/controllers<CR>', opts)
  key_map('n', '<Space>eh', ':Telescope find_files cwd=app/helpers<CR>', opts)
  key_map('n', '<Space>ei', ':Telescope find_files cwd=config/initializers<CR>', opts)
  key_map('n', '<Space>em', ':Telescope find_files cwd=app/models<CR>', opts)
  key_map('n', '<Space>es', ':Telescope find_files cwd=app/assets/styles<CR>', opts)
  key_map('n', '<Space>et', ':Telescope find_files cwd=spec<CR>', opts)
  key_map('n', '<Space>ev', ':Telescope find_files cwd=app/views<CR>', opts)
elseif vim.fn.filereadable('src/index.js') ~= 0 then
  key_map('n', '<Space>ec', ':Telescope find_files cwd=src/components<CR>', opts)
  key_map('n', '<Space>es', ':Telescope find_files cwd=src/styles<CR>', opts)
  key_map('n', '<Space>et', ':Telescope find_files cwd=src/__tests__/components<CR>', opts)
end
