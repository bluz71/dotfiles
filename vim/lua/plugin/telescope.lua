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
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
map("n", "<Space><Space>", '<cmd>lua require("telescope.builtin").find_files()<CR>', opts)
map("n", "<Space>.", '<cmd>lua require("telescope.builtin").find_files({cwd = "%:h"})<CR>', opts)
map("n", "<Space>,", '<cmd>lua require("telescope.builtin").buffers()<CR>', opts)
map("n", "<Space>'", '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', opts)
map("n", "<Space>c", '<cmd>lua require("util.telescope-commands").git_bcommits()<CR>', opts)
map("n", "<Space>g", '<cmd>lua require("util.telescope-commands").git_status()<CR>', opts)
map("n", "<Space>h", '<cmd>lua require("telescope.builtin").help_tags()<CR>', opts)
map("n", "<Space>i", '<cmd>lua require("telescope.builtin").highlights()<CR>', opts)
map("n", "<Space>o", '<cmd>lua require("telescope.builtin").oldfiles()<CR>', opts)
map("n", "<Space>]", '<cmd>lua require("telescope.builtin").tags()<CR>', opts)
map("n", "<Space>/", '<cmd>lua require("telescope.builtin").grep_string({search = vim.fn.input("grep ❯ ")})<CR>', opts)
map("n", "<Space>r", '<cmd>lua require("telescope.builtin").lsp_references()<CR>', opts)
map("n", "<Space>lw", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', opts)
map("n", "<Space>lW", '<cmd>lua require("telescope.builtin").lsp_workspace_symbols({query = vim.fn.input("LSP Workspace Symbols❯ ")})<CR>', opts)

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
