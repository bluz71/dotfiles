local neo_tree = require("neo-tree")

neo_tree.setup({
  enable_diagnostics = false,
  log_level = "warn",
  popup_border_style = "single",
  use_default_mappings = false,
  default_component_configs = {
    -- Disable file columns (size, modified, etc), they are not needed and it
    -- degrades performance slightly.
    file_size = { enabled = false },
    type = { enabled = false },
    last_modified = { enabled = false },
    created = { enabled = false },
    git_status = {
      symbols = {
        -- Change type
        added = "✚",
        deleted = "━",
        modified = "●",
        renamed = "○",
        -- Status type
        untracked = "?",
        ignored = "‼",
        unstaged = "▼",
        staged = "▲",
        conflict = "✖",
      },
    },
    icon = {
      folder_closed = "▷",
      folder_empty = "□",
      folder_open = "◢",
    },
    modified = {
      symbol = "■",
    },
    name = {
      use_git_status_colors = false,
    },
  },
  filesystem = {
    hijack_netrw_behavior = "open_default",
    use_libuv_file_watcher = true,
    filtered_items = {
      show_hidden_count = false,
    },
    window = {
      mappings = {
        ["H"] = "toggle_hidden",
        ["."] = "set_root",
        ["<BS>"] = "navigate_up",
        ["[g"] = "prev_git_modified",
        ["]g"] = "next_git_modified",
      },
    },
  },
  git_status = {
    window = {
      mappings = {
        ["ga"] = "git_add_file",
        ["gu"] = "git_unstage_file",
      },
    },
  },
  window = {
    mappings = {
      ["<2-LeftMouse>"] = "open_with_window_picker",
      ["<CR>"] = "open_with_window_picker",
      ["<Esc>"] = "cancel",
      ["s"] = "open_split",
      ["v"] = "open_vsplit",
      ["N"] = "add",
      ["K"] = "add_directory",
      ["D"] = "delete",
      ["R"] = "rename",
      ["M"] = "move",
      ["r"] = "refresh",
      ["P"] = { "toggle_preview", config = { use_float = true } },
      ["l"] = "focus_preview",
      ["c"] = "close_node",
      ["z"] = "close_all_nodes",
      ["?"] = "show_help",
      ["<"] = "prev_source",
      [">"] = "next_source",
      ["S"] = function(state)
        state.commands["open_split"](state)
        vim.cmd("Neotree reveal")
      end,
    },
  },
})

local map = vim.keymap.set
local opts = { silent = true }
map("n", "<Leader>d", ":Neotree toggle<CR><C-w>=", opts)
map("n", "<Leader>f", ":Neotree reveal<CR><C-w>=", opts)
