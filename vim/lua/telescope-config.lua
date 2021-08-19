local telescope = require('telescope')
local actions = require('telescope.actions')

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
        ["<ESC>"] = actions.close,
        ["<PageUp>"] = actions.preview_scrolling_up,
        ["<PageDown>"] = actions.preview_scrolling_down,
        ["<C-q>"] = false,
        ["<A-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<C-d>"] = require("telescope.actions").delete_buffer
      }
    },
    prompt_prefix = '❯ ',
    selection_caret = '▶ ',
    sorting_strategy = 'ascending',
  }
})

telescope.load_extension('fzf')

local previewers = require('telescope.previewers')
local builtin = require('telescope.builtin')

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
      return {'git', '-c', 'core.pager=delta', '-c', 'delta.pager=less -R', 'diff', entry.value}
    end
  })

  builtin.git_status(opts)
end

-- Mappings.
local key_map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = true}
key_map('n', "''", '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
key_map('n', "'.", ':Telescope find_files cwd=<C-r>=expand("%:h")<CR><CR>', opts)
key_map('n', "',", '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
key_map('n', "'c", '<cmd>lua telescope_git_bcommits()<CR>', opts)
key_map('n', "'g", '<cmd>lua telescope_git_status()<CR>', opts)
key_map('n', "'h", '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
key_map('n', "'i", '<cmd>lua require("telescope.builtin").highlights()<CR>', opts)
key_map('n', "']", '<cmd>lua require("telescope.builtin").tags()<CR>', opts)
key_map('n', "'/", ':Telescope grep_string search=', {noremap = true})
key_map('n', "'r", '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
key_map('n', "'w", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
key_map('n', "'W", ':Telescope lsp_workspace_symbols query=', {noremap = true})

if vim.fn.filereadable('config/routes.rb') ~= 0 then
  key_map('n', "'ec", ':Telescope find_files cwd=app/controllers<CR>', opts)
  key_map('n', "'eh", ':Telescope find_files cwd=app/helpers<CR>', opts)
  key_map('n', "'ei", ':Telescope find_files cwd=config/initializers<CR>', opts)
  key_map('n', "'em", ':Telescope find_files cwd=app/models<CR>', opts)
  key_map('n', "'es", ':Telescope find_files cwd=app/assets/styles<CR>', opts)
  key_map('n', "'et", ':Telescope find_files cwd=spec<CR>', opts)
  key_map('n', "'ev", ':Telescope find_files cwd=app/views<CR>', opts)
elseif vim.fn.filereadable('src/index.js') ~= 0 then
  key_map('n', "'ec", ':Telescope find_files cwd=src/components<CR>', opts)
  key_map('n', "'es", ':Telescope find_files cwd=src/styles<CR>', opts)
  key_map('n', "'et", ':Telescope find_files cwd=src/__tests__/components<CR>', opts)
end
