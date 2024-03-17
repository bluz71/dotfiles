local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

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
    multi_icon = "✚",
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
telescope.load_extension("possession")

-- Mappings.
local map = vim.keymap.set
map("n", "<Space><Space>", builtin.find_files)
map("n", "<Space>.", function()
  builtin.find_files({ cwd = "%:h" })
end)
map("n", "<Space>,", function()
  builtin.buffers({
    sort_mru = true,
    ignore_current_buffer = true,
  })
end)
map("n", "<Space>'", builtin.current_buffer_fuzzy_find)
map("n", "<Space>c", require("util.telescope-commands").git_bcommits)
map("n", "<Space>g", require("util.telescope-commands").git_status)
map("n", "<Space>h", builtin.help_tags)
map("n", "<Space>i", builtin.highlights)
map("n", "<Space>o", builtin.oldfiles)
map("n", "<Space>/", function()
  builtin.grep_string({ search = vim.fn.input("grep ❯ ") })
end)
map("n", "<Space>t", require("util.telescope-commands").themes)

local opts = { silent = true }
if vim.fn.filereadable("config/routes.rb") ~= 0 then
  map("n", "<Space>ec", ":Telescope find_files cwd=app/controllers<CR>", opts)
  map("n", "<Space>em", ":Telescope find_files cwd=app/models<CR>", opts)
  map("n", "<Space>et", ":Telescope find_files cwd=spec<CR>", opts)
  map("n", "<Space>ev", ":Telescope find_files cwd=app/views<CR>", opts)
elseif vim.fn.filereadable("src/index.js") ~= 0 then
  map("n", "<Space>ec", ":Telescope find_files cwd=src/components<CR>", opts)
  map("n", "<Space>et", ":Telescope find_files cwd=src/__tests__/components<CR>", opts)
end

-- Extension mappings.
map("n", "<Space>p", require("telescope").extensions.possession.list)

-- Workaround Telescope highlights bug: https://is.gd/Sjxegs
autocmd("User", {
  pattern = "TelescopePreviewerLoaded",
  callback = function()
    vim.opt_local.splitkeep = "cursor"
  end,
  group = augroup("TelescopePluginEvents", {}),
})
