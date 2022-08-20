local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  ensure_installed = {
    "bash", "c", "cpp", "css", "dart", "go", "html", "java", "javascript",
    "lua", "python", "ruby", "rust", "scss", "toml", "typescript", "vim", "vue",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "ruby", "rust" },
  },

  -- For nvim-autotag plugin.
  autotag = {
    enable = true,
  },
  -- For nvim-ts-context-commentstring plugin.
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- For nvim-treesitter-endwise plugin.
  endwise = {
    enable = true,
  },
})
