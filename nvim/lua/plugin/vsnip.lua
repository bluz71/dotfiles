local cmd = vim.cmd
local fn = vim.fn
local g = vim.g
local map = vim.keymap.set

g.vsnip_snippet_dir = fn.expand("~/dotfiles/nvim/vsnip")

local opts = { expr = true, remap = true }
map("i", "<C-j>", 'vsnip#available(1) ? "<Plug>(vsnip-expand-or-jump)" : "<C-j>"', opts)
map("i", "<C-k>", 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-k>"', opts)

-- Fill in the 'complete' popup with available snippets for the current filetype.
vim.cmd([[
  function! VsnipComplete() abort
      let l:word_to_complete = matchstr(strpart(getline('.'), 0, col('.') - 1), '\S\+$')
      let l:contain_word = 'stridx(v:val.word, l:word_to_complete) >= 0'
      let l:candidates = vsnip#get_complete_items(bufnr('%'))
      let l:candidates = map(filter(l:candidates, l:contain_word),
                    \  "{
                    \      'word': v:val.word,
                    \      'menu': v:val.kind,
                    \      'dup' : 1,
                    \   }")
      let l:from_where = col('.') - len(l:word_to_complete)
      if !empty(l:candidates)
          call complete(l:from_where, l:candidates)
      endif

      return ''
  endfunction
]])

-- Insert mode snippet completion mapping - '<Control-s>'.
map("i", "<C-s>", "<C-r>=VsnipComplete()<CR>")
