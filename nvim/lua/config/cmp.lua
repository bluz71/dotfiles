-- Do not load up plugin when in diff mode.
if vim.opt.diff:get() then
  return
end

local cmp = require("cmp")

-- Helpers for the traditional pop-up completion menu.
local feedkeys = vim.fn.feedkeys
local pumvisible = vim.fn.pumvisible
local replace_termcodes = function(key)
  return vim.api.nvim_replace_termcodes(key, true, true, true)
end

cmp.setup.filetype({ "dart", "eruby", "html", "javascript", "ruby", "rust" }, {
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
    ["<C-e>"] = cmp.mapping.close(),
    ["<C-y>"] = cmp.mapping.confirm({ select = true }),
    ["<Tab>"] = function(fallback)
      if pumvisible() == 1 then
        feedkeys(replace_termcodes("<C-n>"), "n")
      elseif cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if pumvisible() ~= 0 then
        feedkeys(replace_termcodes("<C-p>"), "n")
      elseif cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
    ["<C-f>"] = cmp.mapping.scroll_docs(10),
    ["<C-b>"] = cmp.mapping.scroll_docs(-10),
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
  window = {
    completion = cmp.config.window.bordered({
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel",
    }),
    documentation = false,
  },
})
