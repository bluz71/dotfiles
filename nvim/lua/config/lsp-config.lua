local cmd = vim.cmd
local lsp = vim.lsp
local map = vim.keymap.set
local opt_local = vim.opt_local

-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  cmd([[LspStop]])
  return
end

local nvim_lsp = require("lspconfig")
local nvim_lsp_windows = require("lspconfig.ui.windows")
local buffer = require("util.buffer")
local dart_closing_labels = require("util.dart-closing-labels")
local handlers = require("util.lsp-handlers")
local lsp_capabilities = require("util.lsp-capabilities")

-- Custom on attach function.
local lsp_on_attach = function()
  -- Disable LSP for files larger than 100KB.
  if buffer.is_large(0) then
    print("(LSP) DISABLED, file too large")
    cmd([[LspStop]])
    return
  end

  -- Mappings.
  local opts = { buffer = true }
  map("n", "ga", lsp.buf.code_action, opts)
  map("n", "gd", lsp.buf.definition, opts)
  map("n", "gD", lsp.buf.declaration, opts)
  map("n", "gi", lsp.buf.implementation, opts)
  map("n", "K", lsp.buf.hover, opts)
  map("n", "gr", lsp.buf.references, opts)
  map("n", "gR", lsp.buf.rename, opts)
  map("i", "<C-k>", lsp.buf.signature_help, opts)

  -- Fuzzy mappings using Telescope.
  map("n", "<Space>lr", require("telescope.builtin").lsp_references)
  map("n", "<Space>lw", require("telescope.builtin").lsp_document_symbols)
  map("n", "<Space>lW", function()
    require("telescope.builtin").lsp_workspace_symbols({
      query = vim.fn.input("LSP Workspace Symbols❯ "),
    })
  end)
  -- Note, LSP formatting will be handled by the conform.nvim plugin.

  -- Disable Neovim LSP-set 'omnifunc' and 'formatexpr' options; these options
  -- cause problems with my custom-completion mapping along with the 'gq'
  -- command.
  opt_local.omnifunc = ""
  opt_local.formatexpr = ""
end

-- Global mappings.
map("n", "'r", ":LspRestart<CR>", { silent = true })

-- Add border to LSP windows such as `:LspInfo`.
nvim_lsp_windows.default_options.border = "single"

-- Custom on attach function which disables formatting where ALE will instead
-- be used to format.
local lsp_on_attach_no_formatting = function(client)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  lsp_on_attach()
end

-- Custom on attach function which disable LSP semantic highlighting.
-- local lsp_on_attach_no_semantic_highlights = function(client)
--   client.server_capabilities.semanticTokensProvider = nil
-- end

-- Global handlers.
lsp.handlers["textDocument/hover"] = handlers.hover
lsp.handlers["textDocument/signatureHelp"] = handlers.signature_help

-- The nvim-cmp completion plugin supports most LSP capabilities; we should
-- notify the language servers about that.
local capabilities = lsp_capabilities.default_capabilities()

--------------------------
-- The Language Servers --
--------------------------

nvim_lsp.dartls.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  init_options = { closingLabels = true },
  handlers = {
    ["dart/textDocument/publishClosingLabels"] = dart_closing_labels.handler(),
  },
  root_dir = nvim_lsp.util.root_pattern("pubspec.yaml"),
})

-- pnpm install @typescript-eslint/eslint-plugin@latest --save-dev
nvim_lsp.eslint.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  filetypes = { "svelte", "typescript" },
  flags = { debounce_text_changes = 300 },
})

-- pnpm add -g vscode-langservers-extracted
nvim_lsp.html.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  filetypes = { "eruby", "html" },
  flags = { debounce_text_changes = 300 },
})

nvim_lsp.rust_analyzer.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("Cargo.toml"),
  settings = {
    ["rust-analyzer"] = {
      checkOnSave = {
        command = "clippy",
        extraArgs = { "--", "-Aclippy::needless_return" },
      },
    },
  },
})

-- gem install solargraph
-- solargraph clear
-- solargraph download-core
-- solargraph bundle
nvim_lsp.solargraph.setup({
  on_attach = lsp_on_attach_no_formatting, -- Use standardrb for formatting
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  single_file_support = true, -- Allow LSP to work in standalone Ruby scripts
  settings = { solargraph = { diagnostics = false } },
})

-- gem install standard
nvim_lsp.standardrb.setup({
  on_attach = lsp_on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
})

-- pnpm install -g svelte-language-server
-- pnpm install typescript-svelte-plugin --save-dev
-- Refer to: https://is.gd/jFrFWI
nvim_lsp.svelte.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("svelte.config.js"),
})

-- pnpm add -g typescript typescript-language-server
nvim_lsp.tsserver.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("package.json"),
})

-- pnpm add -g @tailwindcss/language-server
-- pnpm install -D prettier prettier-plugin-tailwindcss
--
--   // prettier.config.js
--   module.exports = {
--     plugins: ['prettier-plugin-tailwindcss'],
--   }
nvim_lsp.tailwindcss.setup({
  on_attach = lsp_on_attach_no_formatting,
  capabilities = capabilities,
  filetypes = { "eruby", "html", "svelte" },
  flags = { debounce_text_changes = 300 },
  root_dir = nvim_lsp.util.root_pattern("tailwind.config.js"),
})
