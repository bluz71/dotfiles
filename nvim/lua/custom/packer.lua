local fn = vim.fn
local packer_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local packer_compiled_path = fn.stdpath("config") .. "/lua/packer_compiled.lua"
local packer_bootstrap = false

-- Bootstrap and install packer.
if fn.empty(fn.glob(packer_path)) > 0 then
  packer_bootstrap = true
  fn.system({ "rm", "-f", packer_compiled_path })
  fn.system({
    "git", "clone", "--depth", "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  })
  print("Bootstrapping Packer, please wait until installation is finished")
  vim.cmd([[packadd packer.nvim]])
end

if fn.filereadable(packer_compiled_path) == 1 then
  -- Speed up loading of Lua modules. Note, this needs to happen BEFORE Lua
  -- plugins are loaded.
  require("impatient")
  -- Due to impatient, the packer_compiled file needs to be directly required.
  require("packer_compiled")
end

local packer = require("packer")
local util = require("packer.util")

-- Initialize packer.nvim.
packer.init({
  compile_path = packer_compiled_path,
  display = {
    open_fn = function()
      return util.float({
        border = "single",
        height = math.ceil(vim.o.lines * 0.5),
      })
    end,
  },
})

-- Plugins.
packer.startup(function()
  -----------------------------
  -- Self-manage packer
  -----------------------------
  use("wbthomason/packer.nvim")

  -----------------------------
  -- Colorscheme plugins
  -----------------------------
  use({
    "~/projects/public/vim-moonfly-colors",
    config = function()
      require("plugin.moonfly")
    end,
  })

  use({
    "~/projects/public/vim-nightfly-guicolors",
    config = function()
      require("plugin.nightfly")
    end,
  })

  -- use("catppuccin/nvim")
  -- use("sainnhe/edge")
  -- use("sainnhe/everforest")
  -- use("gruvbox-community/gruvbox")
  -- use("sainnhe/gruvbox-material")
  -- use("EdenEast/nightfox.nvim")
  -- use("shaunsingh/nord.nvim")
  -- use("sainnhe/sonokai")
  -- use("folke/tokyonight.nvim")

  -----------------------------
  -- Style plugins
  -----------------------------
  use("~/projects/public/vim-mistfly-statusline")
  -- ~/dotfiles/nvim/plugin/mistfly.lua

  use({
    "lukas-reineke/indent-blankline.nvim",
    event = "BufRead",
    config = function()
      require("plugin.indent-blankline")
    end,
  })

  -----------------------------
  -- Behavior plugins
  -----------------------------
  use("phaazon/hop.nvim")
  -- ~/dotfiles/nvim/plugin/hop.lua

  use({
    "tpope/vim-unimpaired",
    keys = { "[", "]" },
    config = function()
      require("plugin.unimpaired")
    end,
  })

  use("wellle/targets.vim")
  use("chaoren/vim-wordmotion")

  use("rhysd/clever-f.vim")
  -- ~/dotfiles/nvim/plugin/clever-f.lua

  use("tpope/vim-surround")
  use("tpope/vim-repeat")
  use("michaeljsmith/vim-indent-object")
  use("ackyshake/VimCompletesMe")

  -----------------------------
  -- Fuzzy finding plugins
  -----------------------------
  use({
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    requires = { "nvim-lua/plenary.nvim" },
    keys = { "<Space>" },
    config = function()
      require("plugin.telescope")
    end,
  })

  use({
    "nvim-telescope/telescope-fzf-native.nvim",
    run = "make",
  })

  -----------------------------
  -- Filesystem plugins
  -----------------------------
  use("lambdalisue/fern.vim")
  -- ~/dotfiles/nvim/plugin/fern.lua
  -- ~/dotfiles/nvim/after/ftplugin/fern.lua

  use("lambdalisue/fern-git-status.vim")
  -- ~/dotfiles/nvim/plugin/fern-git-status.lua

  -----------------------------
  -- Treesitter plugins
  -----------------------------
  use({
    "nvim-treesitter/nvim-treesitter",
    commit = "42ab95d",
    run = ":TSUpdate",
    config = function()
      require("plugin.treesitter")
    end,
  })

  use({
    "nvim-treesitter/playground",
    cmd = "TSHighlightCapturesUnderCursor",
  })

  -----------------------------
  -- Comment plugins
  -----------------------------
  use({
    "numToStr/Comment.nvim",
    requires = { "JoosepAlviste/nvim-ts-context-commentstring" },
    event = "BufRead",
    config = function()
      require("plugin.comment")
    end,
  })

  -----------------------------
  -- Auto-completion plugins
  -----------------------------
  use({
    "hrsh7th/nvim-cmp",
    tag = "v0.0.1",
    requires = {
      { "hrsh7th/cmp-buffer", after = "nvim-cmp" },
      { "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
      { "hrsh7th/cmp-vsnip", after = "nvim-cmp" },
    },
    ft = { "dart", "eruby", "html", "javascript", "ruby", "rust" },
    event = "InsertEnter",
    config = function()
      require("plugin.cmp")
    end,
  })

  use("windwp/nvim-autopairs")
  -- ~/dotfiles/nvim/plugin/autopairs.lua

  use("windwp/nvim-ts-autotag")

  -- The nvim-ts-autotag plugin does not currently support eRuby HTML templates
  -- because they are not Treesitter compatible (maybe one day). Hence, use
  -- pear-tree to tags in `eruby` files
  use({
    "tmsvg/pear-tree",
    ft = { "eruby" },
    config = function()
      require("plugin.pear-tree")
    end,
  })

  use("RRethy/nvim-treesitter-endwise")

  -----------------------------
  -- Development plugins
  -----------------------------
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("plugin.lsp-config")
    end,
  })

  use({
    "j-hui/fidget.nvim",
    ft = { "dart", "javascript", "ruby", "rust" },
    config = function()
      require("plugin.fidget")
    end,
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    ft = {
      "css", "dart", "javascript", "json", "lua", "markdown", "ruby", "rust",
      "scss", "yaml",
    },
    config = function()
      require("plugin.null-ls")
    end,
  })

  use({
    "lewis6991/gitsigns.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    event = "BufRead",
    config = function()
      require("plugin.gitsigns")
    end,
  })

  use({
    "janko-m/vim-test",
    keys = { "'tt", "'tl", "'tf", "'ts" },
    config = function()
      require("plugin.vim-test")
    end,
  })

  use({
    "hrsh7th/vim-vsnip",
    ft = { "dart", "html", "javascript", "markdown", "ruby", "rust" },
    config = function()
      require("plugin.vsnip")
    end,
    -- ~/dotfiles/nvim/vsnip (custom snippets)
  })

  use("tpope/vim-projectionist")
  -- ~/dotfiles/nvim/plugin/projectionist.lua

  use("editorconfig/editorconfig-vim")
  -- ~/dotfiles/nvim/plugin/editorconfig.lua

  use("dart-lang/dart-vim-plugin")

  -----------------------------
  -- Misc plugins
  -----------------------------
  use({
    "NvChad/nvim-colorizer.lua",
    ft = { "css", "lua", "markdown", "scss", "vim", "yaml" },
    config = function()
      require("plugin.colorizer")
    end,
  })

  use({
    "numtostr/FTerm.nvim",
    keys = { "<C-g>" },
    config = function()
      require("plugin.fterm")
    end,
  })

  -- Speed up Neovim startup time.
  use("lewis6991/impatient.nvim")

  use("mbbill/undotree")
  -- ~/dotfiles/nvim/plugin/undotree.lua
  -- ~/dotfiles/nvim/after/ftplugin/undotree.lua

  use("907th/vim-auto-save")
  -- ~/dotfiles/nvim/plugin/auto-save.lua

  use("tpope/vim-obsession")
  -- ~/dotfiles/nvim/plugin/obsession.lua

  use("lifepillar/vim-cheat40")
  -- ~/dotfiles/nvim/plugin/cheat40.lua

  use("gregsexton/MatchTag")
  use("dstein64/vim-startuptime")

  -- Bootstrap packer on fresh installations.
  if packer_bootstrap then
    packer.sync()
  end
end)
