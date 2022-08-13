local telescope = require("telescope")
local actions = require("telescope.actions")
local state = require("telescope.state")
local action_set = require("telescope.actions.set")

telescope.setup({
  defaults = {
    hl_result_eol = false,
    layout_config = {
      height = 0.8,
      prompt_position = "top",
      preview_width = 0.5,
      width = 0.9,
    },
    mappings = {
      i = {
        ["<ESC>"] = actions.close,
        ["<PageUp>"] = actions.preview_scrolling_up,
        ["<PageDown>"] = actions.preview_scrolling_down,
        ["<C-q>"] = false,
        ["<A-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<A-d>"] = require("telescope.actions").delete_buffer,
        ["<C-f>"] = actions.results_scrolling_down,
        ["<C-b>"] = actions.results_scrolling_up,
      },
    },
    -- Declutter leading './' characters.
    path_display = function(opts, path)
      return string.gsub(path, "^./", "")
    end,
    prompt_prefix = "❯ ",
    selection_caret = "▶ ",
    sorting_strategy = "ascending",
  },
  pickers = {
    buffers = {
      show_all_buffers = true,
    },
  },
})

telescope.load_extension("fzf")

-- Mappings.
local map = vim.keymap.set
map("n", "<Space><Space>", require('telescope.builtin').find_files)
map("n", "<Space>.", function()
  require('telescope.builtin').find_files({cwd = '%:h'})
end)
map("n", "<Space>,", require('telescope.builtin').buffers)
map("n", "<Space>'", require('telescope.builtin').current_buffer_fuzzy_find)
map("n", "<Space>r", require('telescope.builtin').resume)
map("n", "<Space>c", require('util.telescope-commands').git_bcommits)
map("n", "<Space>g", require('util.telescope-commands').git_status)
map("n", "<Space>h", require('telescope.builtin').help_tags)
map("n", "<Space>i", require('telescope.builtin').highlights)
map("n", "<Space>o", require('telescope.builtin').oldfiles)
map("n", "<Space>]", require('telescope.builtin').tags)
map("n", "<Space>/", function()
  require('telescope.builtin').grep_string({search = vim.fn.input('grep ❯ ')})
end)
map("n", "<Space>lr", require('telescope.builtin').lsp_references)
map("n", "<Space>lw", require('telescope.builtin').lsp_document_symbols)
map("n", "<Space>lW", function()
  require('telescope.builtin').lsp_workspace_symbols({query = vim.fn.input('LSP Workspace Symbols❯ ')})
end)

local opts = { silent = true }
if vim.fn.filereadable("config/routes.rb") ~= 0 then
  map("n", "<Space>ec", ":Telescope find_files cwd=app/controllers<CR>", opts)
  map("n", "<Space>eh", ":Telescope find_files cwd=app/helpers<CR>", opts)
  map("n", "<Space>ei", ":Telescope find_files cwd=config/initializers<CR>", opts)
  map("n", "<Space>em", ":Telescope find_files cwd=app/models<CR>", opts)
  map("n", "<Space>es", ":Telescope find_files cwd=app/assets/styles<CR>", opts)
  map("n", "<Space>et", ":Telescope find_files cwd=spec<CR>", opts)
  map("n", "<Space>ev", ":Telescope find_files cwd=app/views<CR>", opts)
elseif vim.fn.filereadable("src/index.js") ~= 0 then
  map("n", "<Space>ec", ":Telescope find_files cwd=src/components<CR>", opts)
  map("n", "<Space>es", ":Telescope find_files cwd=src/styles<CR>", opts)
  map("n", "<Space>et", ":Telescope find_files cwd=src/__tests__/components<CR>", opts)
end
