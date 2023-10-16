-- Bootstrap and install lazy.nvim as the Neovim plugin manager.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("Bootstrapping lazy.nvim, please wait until installation is finished")
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local lazy = require("lazy")
local view_config = require("lazy.view.config")

-- Configuration.
local configuration = {
  install = {
    colorscheme = { "nightfly" },
  },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip", "netrwPlugin", "rplugin", "tarPlugin", "tohtml", "tutor",
        "zipPlugin",
      },
    },
  },
  ui = {
    border = "single",
    icons = {
      cmd = "❯",
      config = "✹",
      event = "♢",
      ft = "*",
      init = "⏻",
      keys = "♫",
      plugin = "□",
      runtime = "○",
      source = "‹›",
      start = "▷",
      task = "✔ ",
      lazy = "⠤⠤ ",
      list = { "●", "→", "◉", "‒" },
    },
  },
}

-- Change default key mappings; use '<Esc>' for closing and `<Ctrl-f>` for
-- scrolling (instead of being hijacked for profile filtering).
view_config.keys.close = "<Esc>"
view_config.keys.profile_filter = "<C-p>"

-- Plugins.
lazy.setup({
  -----------------------------
  -- Colorscheme plugins
  -----------------------------
  {
    dir = "~/projects/public/vim-moonfly-colors",
    config = function()
      require("config.moonfly")
    end,
  },

  {
    dir = "~/projects/public/vim-nightfly-colors",
    config = function()
      require("config.nightfly")
    end,
  },

  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "JoosepAlviste/palenightfall.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },

  -----------------------------
  -- Style plugins
  -----------------------------
  {
    dir = "~/projects/public/nvim-linefly",
    -- ~/dotfiles/nvim/after/plugin/linefly.lua
  },

  {
    "nvim-tree/nvim-web-devicons",
    event = "VeryLazy",
    config = function()
      require("config.devicons")
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufReadPre",
    config = function()
      require("config.indent-blankline")
    end,
  },

  -----------------------------
  -- Behavior plugins
  -----------------------------
  {
    "tpope/vim-unimpaired",
    keys = { "[", "]" },
    config = function()
      require("config.unimpaired")
    end,
  },

  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    config = function()
      require("config.hop")
    end,
  },

  "rhysd/clever-f.vim", -- ~/dotfiles/nvim/after/plugin/clever-f.lua
  "wellle/targets.vim",
  "chaoren/vim-wordmotion",
  "michaeljsmith/vim-indent-object",

  -----------------------------
  -- Fuzzy finding plugins
  -----------------------------
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    keys = { "<Space>" },
    config = function()
      require("config.telescope")
    end,
  },

  -----------------------------
  -- Filesystem plugins
  -----------------------------
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      {
        "s1n7ax/nvim-window-picker",
        version = "2.*",
        config = function()
          require("config.window-picker")
        end,
      },
    },
    event = "VeryLazy",
    config = function()
      require("config.neo-tree")
    end,
  },

  -----------------------------
  -- Treesitter plugins
  -----------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.1",
    -- commit = "f2778bd",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      { "RRethy/nvim-treesitter-endwise", name = "nvim-ts-endwise" },
    },
    event = "BufReadPost",
    config = function()
      require("config.treesitter")
    end,
  },

  -----------------------------
  -- Comment plugins
  -----------------------------
  {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
    config = function()
      require("config.comment")
    end,
  },

  -----------------------------
  -- Auto-completion plugins
  -----------------------------
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "dcampos/cmp-snippy",
    },
    event = "InsertEnter",
    config = function()
      require("config.cmp")
    end,
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("config.autopairs")
    end,
  },

  -----------------------------
  -- Development plugins
  -----------------------------
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require("config.lsp-config")
    end,
  },

  {
    "mfussenegger/nvim-lint",
    config = function()
      require("config.lint")
    end,
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require("config.conform")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    config = function()
      require("config.gitsigns")
    end,
  },

  {
    "dcampos/nvim-snippy",
    event = "InsertEnter",
    config = function()
      require("config.snippy")
    end,
    -- ~/dotfiles/nvim/snippets (custom snippets)
  },

  {
    "janko-m/vim-test",
    keys = { "'tt", "'tl", "'tf", "'ts" },
    config = function()
      require("config.vim-test")
    end,
  },

  "tpope/vim-projectionist",
  -- ~/dotfiles/nvim/after/plugin/projectionist.lua

  -----------------------------
  -- Misc plugins
  -----------------------------
  {
    "kylechui/nvim-surround",
    tag = "v1.0.0",
    event = "VeryLazy",
    config = true,
  },

  {
    "NvChad/nvim-colorizer.lua",
    ft = { "css", "html", "lua", "markdown", "scss", "text", "toml", "txt", "vim", "yaml" },
    config = function()
      require("config.colorizer")
    end,
  },

  {
    "numtostr/FTerm.nvim",
    keys = { "<C-g>" },
    config = function()
      require("config.fterm")
    end,
  },

  {
    "lifepillar/vim-cheat40",
    event = "VeryLazy",
    config = function()
      require("config.cheat40")
    end,
  },

  {
    "jedrzejboczar/possession.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    config = function()
      require("config.possession")
    end,
  },

  "mbbill/undotree", -- ~/dotfiles/nvim/after/plugin/undotree.lua
  "907th/vim-auto-save", -- ~/dotfiles/nvim/after/plugin/auto-save.lua
  "gregsexton/MatchTag",
}, configuration)

-- Lazy status window.
vim.keymap.set("n", "'l", ":Lazy<CR>")

-- Profile tab.
vim.keymap.set("n", "'s", ":Lazy profile<CR>")
