local snacks = require("snacks")
local buffer = require("util.buffer")
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

snacks.setup({
  lazygit = {
    config = {
      gui = {
        nerdFontsVersion = "",
      },
    },
    theme = {
      activeBorderColor = { fg = "Directory" },
    },
  },
  indent = {
    animate = {
      enabled = false,
    },
    scope = {
      enabled = true,
      only_current = true,
    },
    chunk = {
      enabled = true,
      only_current = true,
    },
  },
  picker = {
    prompt = "❯ ",
    previewers = {
      git = {
        native = true,
      },
    },
    icons = {
      files = {
        file = "● ",
      },
      git = {
        added = "✚",
        commit = " ",
        deleted = "━",
        enabled = true,
        ignored = "‼ ",
        modified = "●",
        renamed = "○",
        staged = "▲",
        unmerged = "▼ ",
        untracked = "?",
      },
      ui = {
        live = "▶ ",
        selected = "✚ ",
        unselected = "  ",
      },
    },
    win = {
      input = {
        keys = {
          ["<Esc>"] = { "close", mode = { "n", "i" } },
          ["<PageUp>"] = { "preview_scroll_up", mode = { "i", "n" } },
          ["<PageDown>"] = { "preview_scroll_down", mode = { "i", "n" } },
          ["<C-b>"] = { "list_scroll_up", mode = { "i", "n" } },
          ["<C-f>"] = { "list_scroll_down", mode = { "i", "n" } },
          ["<A-q>"] = { "qflist", mode = { "i", "n" } },
          ["<A-d>"] = { "bufdelete", mode = { "n", "i" } },
        },
      },
    },
    layouts = {
      simple = {
        layout = {
          backdrop = false,
          width = 0.4,
          min_width = 50,
          height = 0.5,
          min_height = 20,
          box = "vertical",
          border = "rounded",
          title = "{title}",
          title_pos = "center",
          { win = "input", height = 1, border = "bottom" },
          { win = "list", border = "none" },
          { win = "preview", title = "{preview}", height = 0.4, border = "top" },
        },
      },
      default = {
        layout = {
          backdrop = false,
        },
      },
      select = {
        layout = {
          height = 0.5,
          width = 0.3,
        },
      },
    },
  },
})

-- Mappings.
local map = vim.keymap.set
map("n", "<C-g>", function()
  Snacks.lazygit({ win = { backdrop = false } })
end)
map("n", "<Space><Space>", function()
  Snacks.picker.files()
end)
map("n", "<Space>s", function()
  Snacks.picker.smart()
end)
map("n", "<Space>.", function()
  Snacks.picker.files({ cwd = vim.fn.expand("%:h"), layout = "select" })
end)
map("n", "<Space>,", function()
  Snacks.picker.buffers({ layout = "select" })
end)
map("n", "<Space>/", function()
  Snacks.picker.grep()
end)
map("n", "<Space>*", function()
  Snacks.picker.grep_word()
end)
map("n", "<Space>b", function()
  Snacks.picker.git_log_line({ title = "Git Blame" })
end)
map("n", "<Space>c", function()
  Snacks.picker.git_log_file()
end)
map("n", "<Space>g", function()
  Snacks.picker.git_status()
end)
map("n", "<Space>h", function()
  Snacks.picker.help()
end)
map("n", "<Space>i", function()
  Snacks.picker.highlights()
end)
map("n", "<Space>r", function()
  Snacks.picker.lsp_references()
end)
map("n", "<Space>t", function()
  -- Colorschmes to ignore.
  vim.opt_local.wildignore = {
    "**/colors/blue.vim", "**/colors/darkblue.vim", "**/colors/delek.vim", "**/colors/desert.vim",
    "**/colors/elflord.vim", "**/colors/evening.vim", "**/colors/habamax.vim",
    "**/colors/industry.vim", "**/colors/koehler.vim", "**/colors/lunaperche.vim",
    "**/colors/morning.vim", "**/colors/murphy.vim", "**/colors/pablo.vim",
    "**/colors/peachpuff.vim", "**/colors/quiet.vim", "**/colors/ron.vim", "**/colors/shine.vim",
    "**/colors/slate.vim", "**/colors/sorbet.vim", "**/colors/torte.vim", "**/colors/vim.lua",
    "**/colors/wildcharm.vim", "**/colors/zaibatsu.vim", "**/colors/zellner.vim",
    "**/colors/catppuccin-*", "**/colors/kanagawa-*", "**/colors/carbonfox*", "**/colors/d*fox*",
    "**/colors/nordfox*", "**/colors/t*fox*", "**/colors/tokyonight-*",
  }
  Snacks.picker.colorschemes({ layout = "simple", title = "Themes" })
end)
if vim.fn.filereadable("config/routes.rb") ~= 0 then
  map("n", "<Space>ec", function()
    Snacks.picker.files({ cwd = "app/controllers", layout = "select" })
  end)
  map("n", "<Space>ef", function()
    Snacks.picker.files({ cwd = "app/frontend/entrypoints", layout = "select" })
  end)
  map("n", "<Space>em", function()
    Snacks.picker.files({ cwd = "app/frontend/models", layout = "select" })
  end)
  map("n", "<Space>eo", function()
    Snacks.picker.files({ cwd = "app/components", layout = "select" })
  end)
  map("n", "<Space>et", function()
    Snacks.picker.files({ cwd = "test", layout = "select" })
  end)
  map("n", "<Space>ev", function()
    Snacks.picker.files({ cwd = "app/views", layout = "select" })
  end)
elseif vim.fn.filereadable("src/index.js") ~= 0 then
  map("n", "<Space>eo", function()
    Snacks.picker.files({ cwd = "src/components", layout = "select" })
  end)
  map("n", "<Space>et", function()
    Snacks.picker.files({ cwd = "src/__tests__/components", layout = "select" })
  end)
end

-- Disable Snacks indent for files larger than 100K in size.
autocmd("BufEnter", {
  callback = function()
    if buffer.is_large(0) then
      Snacks.indent.disable()
    end
  end,
  group = augroup("SnacksPluginEvents", {})
})
