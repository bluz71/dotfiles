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
    colorscheme = { "moonfly" },
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
      list = { "●", "→", "🞊", "‒", },
    },
  }
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
    -- dir = "~/projects/public/vim-mistfly-statusline",
    -- ~/dotfiles/nvim/after/plugin/mistfly.lua
    dir = "~/projects/public/nvim-linefly",
    -- ~/dotfiles/nvim/after/plugin/linefly.lua
  },

  {
    "lukas-reineke/indent-blankline.nvim",
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
      require("config.telescope")
    end,
  },

  -----------------------------
  -- Filesystem plugins
  -----------------------------
  {
    "lambdalisue/fern.vim",
    event = "VeryLazy",
    dependencies = { "lambdalisue/fern-git-status.vim" },
    config = function()
      require("config.fern")
      require("config.fern-git-status")
    end,
  },

  -----------------------------
  -- Treesitter plugins
  -----------------------------
  {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.8.1",
    build = ":TSUpdate",
    dependencies = {
      "windwp/nvim-ts-autotag",
      "JoosepAlviste/nvim-ts-context-commentstring",
      { "RRethy/nvim-treesitter-endwise", name = "nvim-ts-endwise" },
      { "nvim-treesitter/playground", name = "nvim-ts-playground" }, -- XXX Remove for Neovim 0.9
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
    tag = "v0.0.1",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      { "hrsh7th/cmp-vsnip", commit = "1ae05c6"},
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

  -- The nvim-ts-autotag plugin does not currently support eRuby HTML templates
  -- because they are not Treesitter compatible (maybe one day). Hence, use
  -- pear-tree to complete tags in `eruby` files
  {
    "tmsvg/pear-tree",
    ft = { "eruby" },
    config = function()
      require("config.pear-tree")
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
    "j-hui/fidget.nvim",
    ft = { "dart", "javascript", "ruby", "rust" },
    config = function()
      require("config.fidget")
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "css", "dart", "javascript", "json", "lua", "markdown", "rust", "scss",
      "yaml",
    },
    config = function()
      require("config.null-ls")
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
    "hrsh7th/vim-vsnip",
    commit = "ceeee48",
    event = "InsertEnter",
    config = function()
      require("config.vsnip")
    end,
    -- ~/dotfiles/nvim/vsnip (custom snippets)
  },

  {
    "janko-m/vim-test",
    keys = { "'tt", "'tl", "'tf", "'ts" },
    config = function()
      require("config.vim-test")
    end,
  },

  { "dart-lang/dart-vim-plugin", ft = "dart", },
  "tpope/vim-projectionist",
  -- ~/dotfiles/nvim/after/plugin/projectionist.lua
  "editorconfig/editorconfig-vim", -- XXX Remove for Neovim 0.9
  -- ~/dotfiles/nvim/after/plugin/editorconfig.lua

  -----------------------------
  -- Misc plugins
  -----------------------------
  {
    "NvChad/nvim-colorizer.lua",
    ft = { "css", "lua", "markdown", "scss", "text", "vim", "yaml" },
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
    "dstein64/vim-startuptime",
    keys = "'s",
    config = function()
      require("config.startup")
    end,
  },

  {
    "lifepillar/vim-cheat40",
    cmd = "Cheat40",
    config = function()
      require("config.cheat40")
    end,
  },

  "mbbill/undotree", -- ~/dotfiles/nvim/after/plugin/undotree.lua
  "907th/vim-auto-save", -- ~/dotfiles/nvim/after/plugin/auto-save.lua
  "tpope/vim-obsession", -- ~/dotfiles/nvim/after/plugin/obsession.lua
  "gregsexton/MatchTag",
}, configuration)

-- Lazy floating window.
vim.keymap.set("n", "'l", ":Lazy<CR>")
