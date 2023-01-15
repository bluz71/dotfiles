Neovim
======

My Neovim configuration.

Structure
---------

```
.
├── init.lua        | Neovim initialization file
├── after/          | Standard auto-loading 'after' base directory
│     ├── ftplugin/ | Auto-loading 'filetype' configs
│     └── plugin/   | Auto-loading 'plugin' configs
├── autoload/       | Standard 'autoload' directory for Vimscript functions
├── ftplugin/       | Standard 'filetype' configs
└── lua/            | Lua base directory
      ├── config/   | Plugin configs that ARE lazy-loaded via explicit 'require'
      ├── custom/   | Autocmds, plugin-manager, mappings and options configs
      └── util/     | Utility functions
```

Components
----------

- [lazy.nvim](https://github.com/folke/lazy.nvim) plugin management
- [Tree-sitter](https://github.com/nvim-treesitter/nvim-treesitter) for syntax highlighting
- [LSP](https://github.com/neovim/nvim-lspconfig) configuration for: Dart, HTML, JavaScript, Rust & Ruby
- [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) for auto-completion
- [Telescape](https://github.com/nvim-telescope/telescope.nvim) for fuzzy finding
- [Fern](https://github.com/lambdalisue/fern.vim) for file exploration
- Lazygit loaded via [FTerm](https://github.com/numtostr/FTerm.nvim)
- [linefly](https://github.com/bluz71/nvim-linefly) for statusline, tabline and winbar
- [moonfly](https://github.com/bluz71/vim-moonfly-colors) & [nightfly](https://github.com/bluz71/vim-nightfly-colors) colorschemes
