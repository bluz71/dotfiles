-- Bootstrap packer.nvim.
local fn = vim.fn
local command = vim.api.nvim_command
local packer_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
local packer_compiled_path = fn.stdpath('config')..'/lua/packer_compiled.lua'
if fn.empty(fn.glob(packer_path)) > 0 then
  command('\rm -f '..packer_compiled_path)
  command('!git clone https://github.com/wbthomason/packer.nvim '..packer_path)
  command('packadd packer.nvim')
end

if fn.filereadable(packer_compiled_path) then
  -- Speed up loading of Lua modules. Note, this needs to happen BEFORE Lua
  -- plugins are loaded.
  require('impatient')
  -- Due to impatient, the packer_compiled file needs to be directly required.
  require('packer_compiled')
end

local packer = require('packer')
local util = require('packer.util')

-- Initialize packer.nvim.
packer.init({
  compile_path = packer_compiled_path,
  display = {
    open_fn = function()
      return util.float({
        border = 'single', height = math.ceil(vim.o.lines * 0.5)
      })
    end
  }
})

-- Plugins.
packer.startup(function()
  -----------------------------
  -- Self-manage packer
  -----------------------------
  use 'wbthomason/packer.nvim'

  -----------------------------
  -- Style plugins
  -----------------------------
  use {
    'lukas-reineke/indent-blankline.nvim',
    event = 'BufRead',
    config = function()
      require('plugin.indent-blankline')
    end
  }

  -----------------------------
  -- Behavior plugins
  -----------------------------
  use {
    'phaazon/hop.nvim',
    config = function()
      require('plugin.hop')
    end
  }

  use {
    'tpope/vim-unimpaired',
    keys = {'[', ']'},
    config = function()
      require('plugin.unimpaired')
    end
  }

  use 'michaeljsmith/vim-indent-object'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'ackyshake/VimCompletesMe'

  -----------------------------
  -- Fuzzy finding plugins
  -----------------------------
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    keys = {'<Space>'},
    config = function()
      require('plugin.telescope')
    end
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'make'
  }

  -----------------------------
  -- Treesitter plugins
  -----------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    branch = '0.5-compat',
    run = ':TSUpdate',
    config = function()
      require('plugin.treesitter')
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    branch = '0.5-compat'
  }

  use {
    'nvim-treesitter/playground',
    cmd = 'TSHighlightCapturesUnderCursor'
  }

  -----------------------------
  -- Auto-completion plugins
  -----------------------------
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-vsnip'
    },
    config = function()
      require('plugin.cmp')
    end
  }

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('plugin.autopairs')
    end
  }

  use {
    -- Only use pear-tree to complete tags, instead use nvim-autopairs to
    -- complete most standard pairings (parentheses, quotes, etc).
    --
    -- Note, pear-tree does not play well with nvim-cmp when completing
    -- parentheses (for whatever reason). Hence, the limiting of pear-tree to
    -- tag-only complation.
    --
    -- Also, the nvim-ts-autotag plugin (a tag completion plugin by the same
    -- author as nvim-autopairs) does not currently support eRuby HTML templates
    -- because they are not Treesitter compatible (maybe one day). Hence, the
    -- on-going use of pear-tree for tag completion (for now).
    'tmsvg/pear-tree',
    config = function()
      require('plugin.pear-tree')
    end
  }

  -----------------------------
  -- Development plugins
  -----------------------------
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('plugin.lsp-config')
    end
  }

  use {
    'lewis6991/gitsigns.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('plugin.gitsigns')
    end
  }

  use {
    'dense-analysis/ale',
    config = function()
      require('plugin.ale')
    end
  }

  use {
    'janko-m/vim-test',
    keys = {"'tt", "'tl", "'tf", "'ts"},
    config = function()
      require('plguin.vim-test')
    end
  }

  use {
    'hrsh7th/vim-vsnip',
    ft = {'dart', 'html', 'javascript', 'markdown', 'ruby'},
    config = function()
      require('plugin.vsnip')
    end
    -- ~/dotfiles/vim/vsnip - custom snippets
  }

  use {
    'tpope/vim-projectionist',
    config = function()
      require('plugin.projectionist')
    end
  }

  use {
    'editorconfig/editorconfig-vim',
    config = function()
      require('plugin.editorconfig')
    end
  }

  use 'dart-lang/dart-vim-plugin'
  use 'vim-crystal/vim-crystal'

  -----------------------------
  -- Misc plugins
  -----------------------------
  use {
    'norcalli/nvim-colorizer.lua',
    ft = {'css', 'json', 'lua', 'markdown', 'scss', 'vim', 'yaml'},
    config = function()
      require('plugin.colorizer')
    end,
  }

  use 'gregsexton/MatchTag'

  -- Workaround for Neovim bug, see:
  --   https://github.com/neovim/neovim/issues/12587
  use 'antoinemadec/FixCursorHold.nvim'

  -- Speed up Neovim startup time.
  use 'lewis6991/impatient.nvim'

  -- Also speed up Neovim startup time.
  use("nathom/filetype.nvim")
end)
