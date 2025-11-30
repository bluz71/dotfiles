local treesitter = require("nvim-treesitter.configs")
local buffer = require("util.buffer")

treesitter.setup({
  -- No need to ensure_installed the following parsers.
  ensure_installed = {
    "astro", "bash", "c", "clojure", "cpp", "css", "dart", "elixir", "elm", "embedded_template",
    "fish", "go", "haskell", "html", "java", "javascript", "json", "julia", "lua", "markdown",
    "markdown_inline", "odin", "php", "python", "r", "regex", "ruby", "rust", "scala", "scss",
    "svelte", "toml", "tsx", "typescript", "vim", "vimdoc", "vue", "zig"
  },
  highlight = {
    enable = true,
    disable = function(_, buf)
      if buffer.is_large(buf) then
        return true
      end
    end,
  },
  incremental_selection = {
    enable = false,
  },
  indent = {
    enable = true,
    disable = function(lang, buf)
      if lang == "html" or lang == "ruby" or lang == "rust" or buffer.is_large(buf) then
        -- Disable indent for certain filetypes & large files.
        return true
      end
    end,
  },

  -- For nvim-treesitter-endwise plugin.
  endwise = {
    enable = true,
  },
})

-- Setup Tree-sitter parser for Crystal.
--
-- Reference: https://is.gd/fxgR6H
local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
parser_config.crystal = {
  install_info = {
    url = "~/projects/public/tree-sitter-crystal",
    files = {"src/parser.c", "src/scanner.c"},
    branch = "main",
  },
  filetype = "cr",
}
