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
  vim.cmd("packadd packer.nvim")
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
  -- use('dracula/vim')
  -- use("sainnhe/edge")
  -- use("embark-theme/vim")
  -- use("sainnhe/everforest")
  -- use("gruvbox-community/gruvbox")
  -- use("sainnhe/gruvbox-material")
  -- use("rebelot/kanagawa.nvim")
  -- use("EdenEast/nightfox.nvim")
  -- use("shaunsingh/nord.nvim")
  -- use("drewtempelmeyer/palenight.vim")
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

  use("nelstrom/vim-visual-star-search")
  use("wellle/targets.vim")
  use("chaoren/vim-wordmotion")
  -- ~/dotfiles/vim/after/plugin/wordmotion.vim

  use("tommcdo/vim-lion")
  -- ~/dotfiles/nvim/plugin/lion.lua

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
    commit = "07b7221",
    run = ":TSUpdate",
    config = function()
      require("plugin.treesitter")
    end,
  })

  use("nvim-treesitter/nvim-treesitter-textobjects")

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
    requires = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-vsnip",
    },
    config = function()
      require("plugin.cmp")
    end,
  })

  use("windwp/nvim-autopairs")
  -- ~/dotfiles/nvim/plugin/autopairs.lua

  -- Only use pear-tree to complete tags, instead use nvim-autopairs to complete
  -- most standard pairings (parentheses, quotes, etc).
  --
  -- Note, pear-tree does not play well with nvim-cmp when completing
  -- parentheses (for whatever reason). Hence, the limiting of pear-tree to
  -- tag-only complation.
  --
  -- Also, the nvim-ts-autotag plugin (a tag completion plugin by the same
  -- author as nvim-autopairs) does not currently support eRuby HTML templates
  -- because they are not Treesitter compatible (maybe one day). Hence, the
  -- on-going use of pear-tree for tag completion (for now).
  use("tmsvg/pear-tree")
  -- ~/dotfiles/nvim/plugin/pear-tree.lua

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
    ft = {
      "dart", "javascript", "ruby", "rust",
    },
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
    -- ~/dotfiles/vim/vsnip (custom snippets)
  })

  use("tpope/vim-projectionist")
  -- ~/dotfiles/nvim/plugin/projectionist.lua

  use("editorconfig/editorconfig-vim")
  -- ~/dotfiles/nvim/plugin/editorconfig.lua

  use("dart-lang/dart-vim-plugin")
  use("vim-crystal/vim-crystal")

  -----------------------------
  -- Misc plugins
  -----------------------------
  use({
    "norcalli/nvim-colorizer.lua",
    ft = { "css", "json", "lua", "markdown", "scss", "vim", "yaml" },
    config = function()
      require("plugin.colorizer")
    end,
  })

  -- Speed up Neovim startup time.
  use("lewis6991/impatient.nvim")

  -- Workaround for Neovim bug, see:
  --   https://github.com/neovim/neovim/issues/12587
  use("antoinemadec/FixCursorHold.nvim")

  use("mbbill/undotree")
  -- ~/dotfiles/nvim/plugin/undotree.lua
  -- ~/dotfiles/vim/after/ftplugin/undotree.vim

  use("907th/vim-auto-save")
  -- ~/dotfiles/nvim/plugin/auto-save.lua

  use("christoomey/vim-tmux-navigator")
  -- ~/dotfiles/nvim/plugin/tmux-navigator.lua

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
