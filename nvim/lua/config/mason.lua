-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local mason = require("mason")
local map = vim.keymap.set

mason.setup({
  -- Install these packages through Mason:
  --   astro-language-server,
  --   css-lsp,
  --   eslint-lsp,
  --   html-lsp,
  --   jsonlint,
  --   markdownlint,
  --   prettier,
  --   rust-analyzer,
  --   selene,
  --   stylua,
  --   tailwindcss-language-server,
  --   typescript-language-server,
  ui = {
    border = "single",
  },
})

map("n", "'m", ":Mason<CR>")
