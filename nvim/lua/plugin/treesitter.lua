local treesitter = require("nvim-treesitter.configs")

treesitter.setup({
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  ensure_installed = {
    "bash", "c", "cpp", "css", "dart", "go", "html", "java", "javascript",
    "lua", "python", "ruby", "rust", "scss", "toml", "typescript", "vue",
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
    disable = { "ruby", "rust", "yaml" },
  },
  textobjects = {
    select = {
      enable = true,
      disable = { "dart", "ruby" }, -- Temporary fix, see: https://is.gd/E00YDa
      lookahead = true,
      keymaps = {
        ["am"] = "@function.outer",
        ["im"] = "@function.inner",
      },
    },
    move = {
      enable = true,
      disable = { "dart", "ruby" }, -- Temporary fix, see: https://is.gd/E00YDa
      set_jumps = true,
      goto_next_start = {
        ["]m"] = "@function.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
      },
    },
  },
  endwise = {
    enable = true,
  },
})
