Neovim
======

My Neovim configuration.

Structure
---------

```
.
├── init.lua        | Neovim initialization file
├── after/          | Standard auto-loading 'after' directory
│     ├── ftplugin/ | After 'filetype' configs
│     └── plugin/   | After 'plugin' configs that are NOT lazy-loaded
├── autoload/       | Standard 'autoload' directory for Vimscript functions
├── ftplugin/       | Standard 'filetype' configs
└── lua/            | Lua base directory
      ├── config/   | Plugin configurations that ARE lazy-loaded
      ├── custom/   | Autocmds, plugin-manager, mappings and options configs
      └── util/     | Utility functions
```

Plugins
-------

- [Comment.nvim](https://github.com/numToStr/Comment.nvim)
- [FTerm.nvim](https://github.com/numtostr/FTerm.nvim)
- [MatchTag](https://github.com/gregsexton/MatchTag)
- [VimCompletesMe](https://github.com/ackyshake/VimCompletesMe )
- [clever-f.vim](https://github.com/rhysd/clever-f.vim)
- [cmp-buffer](https://github.com/hrsh7th/cmp-buffer)
- [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp)
- [cmp-vsnip](https://github.com/hrsh7th/cmp-vsnip)
- [editorconfig-vim](https://github.com/editorconfig/editorconfig-vim)
- [fern-git-status.vim](https://github.com/lambdalisue/fern-git-status.vim)
- [fern.vim](https://github.com/lambdalisue/fern.vim)
- [fidget.nvim](https://github.com/j-hui/fidget.nvim)
- [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim)
- [hop.nvim](https://github.com/phaazon/hop.nvim)
- [indent-blankline.nvim](https://github.com/lukas-reineke/indent-blankline.nvim)
- [lazy.nvim](https://github.com/folke/lazy.nvim)
- [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim)
- [nvim-autopairs](https://github.com/windwp/nvim-autopairs)
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)
- [nvim-colorizer.lua](https://github.com/NvChad/nvim-colorizer.lua)
- [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig)
- [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter)
- [nvim-ts-autotag](https://github.com/windwp/nvim-ts-autotag)
- [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring)
- [nvim-ts-endwise](https://github.com/RRethy/nvim-treesitter-endwise)
- [pear-tree](https://github.com/tmsvg/pear-tree)
- [playground](https://github.com/nvim-treesitter/playground)
- [plenary.nvim](https://github.com/nvim-lua/plenary.nvim)
- [targets.vim](https://github.com/wellle/targets.vim)
- [telescope-fzf-native.nvim](https://github.com/nvim-telescope/telescope-fzf-native.nvim)
- [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)
- [undotree](https://github.com/mbbill/undotree)
- [vim-auto-save](https://github.com/907th/vim-auto-save)
- [vim-cheat40](https://github.com/lifepillar/vim-cheat40)
- [vim-indent-object](https://github.com/michaeljsmith/vim-indent-object)
- [vim-mistfly-statusline](https://github.com/bluz71/vim-mistfly-statusline)
- [vim-moonfly-colors](https://github.com/bluz71/vim-moonfly-colors)
- [vim-nightfly-colors](https://github.com/bluz71/vim-nightfly-colors)
- [vim-obsession](https://github.com/tpope/vim-obsession)
- [vim-projectionist](https://github.com/tpope/vim-projectionist)
- [vim-repeat](https://github.com/tpope/vim-repeat)
- [vim-startuptime](https://github.com/dstein64/vim-startuptime)
- [vim-surround](https://github.com/tpope/vim-surround)
- [vim-unimpaired](https://github.com/tpope/vim-unimpaired)
- [vim-vsnip](https://github.com/hrsh7th/vim-vsnip)
- [vim-wordmotion](https://github.com/chaoren/vim-wordmotion)
