-- Bootstrap and install lazy.nvim as the Neovim plugin manager.
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

local lazy = require("lazy")

-- Configuration.
local configuration = {
  install = {
    colorscheme = { "moonfly" },
  },
  ui = {
    border = "single",
    icons = {
      cmd = "❯",
      config = "🞿",
      event = "♢",
      ft = "*",
      init = "⏻",
      keys = "♫",
      plugin = "🞐",
      runtime = "🞆",
      source = " ",
      start = "▷",
      task = "✔ ",
      lazy = "⠤⠤ ",
    },
  }
}

-- Plugins.
lazy.setup({
  -----------------------------
  -- Colorscheme plugins
  -----------------------------
  {
    dir = "~/projects/public/vim-moonfly-colors",
    config = function()
      require("plugin.moonfly")
    end,
  },

  {
    dir = "~/projects/public/vim-nightfly-colors",
    config = function()
      require("plugin.nightfly")
    end,
  },

  { "catppuccin/nvim", name = "catppuccin", lazy = true },
  { "sainnhe/edge", name = "vim-edge", lazy = true },
  { "sainnhe/everforest", name = "vim-everforest", lazy = true },
  { "sainnhe/gruvbox-material", name = "vim-gruvbox-material", lazy = true },
  { "ellisonleao/gruvbox.nvim", lazy = true },
  { "EdenEast/nightfox.nvim", lazy = true },
  { "shaunsingh/nord.nvim", lazy = true },
  { "folke/tokyonight.nvim", lazy = true },

  -----------------------------
  -- Style plugins
  -----------------------------
  {
    dir = "~/projects/public/vim-mistfly-statusline",
  },
  -- ~/dotfiles/nvim/plugin/mistfly.lua

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "BufReadPre",
    config = function()
      require("plugin.indent-blankline")
    end,
  },

  -----------------------------
  -- Behavior plugins
  -----------------------------
  {
    "tpope/vim-unimpaired",
    keys = { "[", "]" },
    config = function()
      require("plugin.unimpaired")
    end,
  },

  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
  },
  -- ~/dotfiles/nvim/plugin/hop.lua

  "rhysd/clever-f.vim",
  -- ~/dotfiles/nvim/plugin/clever-f.lua

  "wellle/targets.vim",
  "chaoren/vim-wordmotion",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "michaeljsmith/vim-indent-object",
  "ackyshake/VimCompletesMe",

  -----------------------------
  -- Fuzzy finding plugins
  -----------------------------
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { 
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" }
    },
    keys = { "<Space>" },
    config = function()
      require("plugin.telescope")
    end,
  },

  -----------------------------
  -- Filesystem plugins
  -----------------------------
  {
    "lambdalisue/fern.vim",
    cmd = "Fern",
    dependencies = {
      "lambdalisue/fern-git-status.vim"
    },
  },
  -- ~/dotfiles/nvim/plugin/fern.lua
  -- ~/dotfiles/nvim/after/ftplugin/fern.lua
  -- ~/dotfiles/nvim/plugin/fern-git-status.lua

  -----------------------------
  -- Treesitter plugins
  -----------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    commit = "42ab95d",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      { "RRethy/nvim-treesitter-endwise", name = "nvim-ts-endwise" },
      { "nvim-treesitter/playground", name = "nvim-ts-playground" },
    },
    event = "BufReadPost",
    config = function()
      require("plugin.treesitter")
    end,
  },

  -----------------------------
  -- Comment plugins
  -----------------------------
  {
    "numToStr/Comment.nvim",
    event = "BufReadPre",
    config = function()
      require("plugin.comment")
    end,
  },

  -----------------------------
  -- Auto-completion plugins
  -----------------------------
  {
    "hrsh7th/nvim-cmp",
    tag = "v0.0.1",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      { "hrsh7th/cmp-vsnip", commit = "1ae05c6"},
    },
    event = "InsertEnter",
    config = function()
      require("plugin.cmp")
    end,
  },

  {
    "hrsh7th/vim-vsnip",
    commit = "ceeee48",
    event = "InsertEnter",
    config = function()
      require("plugin.vsnip")
    end,
  },
  -- ~/dotfiles/nvim/vsnip (custom snippets)

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
  },
  -- ~/dotfiles/nvim/plugin/autopairs.lua

  -- The nvim-ts-autotag plugin does not currently support eRuby HTML templates
  -- because they are not Treesitter compatible (maybe one day). Hence, use
  -- pear-tree to complete tags in `eruby` files
  {
    "tmsvg/pear-tree",
    ft = { "eruby" },
    config = function()
      require("plugin.pear-tree")
    end,
  },

  -----------------------------
  -- Development plugins
  -----------------------------
  {
    "neovim/nvim-lspconfig",
    event = "BufReadPre",
    config = function()
      require("plugin.lsp-config")
    end,
  },

  {
    "j-hui/fidget.nvim",
    ft = { "dart", "javascript", "ruby", "rust" },
    config = function()
      require("plugin.fidget")
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "css", "dart", "javascript", "json", "lua", "markdown", "ruby", "rust",
      "scss", "yaml",
    },
    config = function()
      require("plugin.null-ls")
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "BufReadPre",
    config = function()
      require("plugin.gitsigns")
    end,
  },

  {
    "janko-m/vim-test",
    keys = { "'tt", "'tl", "'tf", "'ts" },
    config = function()
      require("plugin.vim-test")
    end,
  },

  "tpope/vim-projectionist",
  -- ~/dotfiles/nvim/plugin/projectionist.lua

  "editorconfig/editorconfig-vim",
  -- ~/dotfiles/nvim/plugin/editorconfig.lua

  "dart-lang/dart-vim-plugin",

  -----------------------------
  -- Misc plugins
  -----------------------------
  {
    "NvChad/nvim-colorizer.lua",
    ft = { "css", "lua", "markdown", "scss", "text", "vim", "yaml" },
    config = function()
      require("plugin.colorizer")
    end,
  },

 {
    "numtostr/FTerm.nvim",
    keys = { "<C-g>" },
    config = function()
      require("plugin.fterm")
    end,
  },

  {
    "dstein64/vim-startuptime",
    keys = "'s",
    config = function()
      require("plugin.startup")
    end,
  },

  {
    "lifepillar/vim-cheat40",
    cmd = "Cheat40"
  },
  -- ~/dotfiles/nvim/plugin/cheat40.lua

  "mbbill/undotree",
  -- ~/dotfiles/nvim/plugin/undotree.lua
  -- ~/dotfiles/nvim/after/ftplugin/undotree.lua

  "907th/vim-auto-save",
  -- ~/dotfiles/nvim/plugin/auto-save.lua

  "tpope/vim-obsession",
  -- ~/dotfiles/nvim/plugin/obsession.lua


  "gregsexton/MatchTag",
}, configuration)

-- Lazy window.
vim.keymap.set("n", "'l", ":Lazy<CR>")
