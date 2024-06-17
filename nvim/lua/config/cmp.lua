-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local cmp = require("cmp")

cmp.setup.filetype({ "astro", "css", "eruby", "html", "javascript", "ruby", "rust", "typescript" }, {
  formatting = {
    format = function(entry, item)
      item.menu = ({
        nvim_lsp = "[L]",
        vsnip = "[S]",
        buffer = "[B]",
      })[entry.source.name]
      return item
    end,
  },
  mapping = {
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end, { "i" }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end, { "i" }),
  },
  snippet = {
    expand = function(args)
      require("snippy").expand_snippet(args.body)
    end,
  },
  sources = {
    {
      name = "nvim_lsp",
      keyword_length = 3,
      max_item_count = 15,
      -- To list the trigger characters for the current LSP:
      --   lua print(vim.inspect(vim.lsp.buf_get_clients()[1].server_capabilities.completionProvider.triggerCharacters))
      trigger_characters = { ".", "@", ":", "/", "'", "(" },
    },
    { name = "snippy", keyword_length = 3, max_item_count = 5 },
    { name = "buffer", keyword_length = 4, max_item_count = 10 },
  },
  view = {
    entries = {
      follow_cursor = true,
    }
  },
  window = {
    completion = cmp.config.window.bordered({}),
    documentation = false,
  },
})
