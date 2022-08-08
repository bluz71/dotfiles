"-----------------------------
" Function key mappings
"-----------------------------
" Double up function key mappings with single-quote+number mappings for
" touchbar Macbooks which have no physical function keys.
nnoremap <F1> :TSHighlightCapturesUnderCursor<CR>
nnoremap '1   :TSHighlightCapturesUnderCursor<CR>
nnoremap <F2> :w<CR>
nnoremap '2   :w<CR>
nnoremap <F3> :%retab<CR>:%s/\s\+$//<CR>
nnoremap '3   :%retab<CR>:%s/\s\+$//<CR>
nnoremap <F4> :%s/ /_<CR>
nnoremap '4   :%s/ /_<CR>
nnoremap <F5> :call spelling#Toggle()<CR>
nnoremap '5   :call spelling#Toggle()<CR>
nnoremap <F6> :call diagnostics#Toggle()<CR>
nnoremap '6   :call diagnostics#Toggle()<CR>
nnoremap <F7> :set lazyredraw!<CR>:call AutoSaveToggle()<CR>
nnoremap '7   :set lazyredraw!<CR>:call AutoSaveToggle()<CR>
nnoremap <F8> :set wrap!<CR>
nnoremap '8   :set wrap!<CR>
nnoremap <F9> :set hlsearch!<CR>
nnoremap '9   :set hlsearch!<CR>
nnoremap <silent> '0    :call listchars#Toggle()<CR>
nnoremap <silent> <F10> :call listchars#Toggle()<CR>

"-----------------------------
" Completion mappings
"-----------------------------
"   ]     - 'tags' file completion
"   Space - context aware omni completion (via 'omnifunc' setting)
"   b     - keyword completion from the current buffer (<C-n><C-b> to extend)
"   d     - dictionary completion (via 'dictionary' setting)
"   f     - file path completion
"   l     - line completion (repeat an existing line)
inoremap <C-]>     <C-x><C-]>
inoremap <C-Space> <C-x><C-o>
inoremap <C-b>     <C-x><C-p>
inoremap <C-d>     <C-x><C-k>
inoremap <C-f>     <C-x><C-f>
inoremap <C-l>     <C-x><C-l>
"   s - snippet completion
" Refer to ~/dotfiles/vim/lua/vsnip-config.lua:

"-----------------------------
" Increment and decrement mappings
"-----------------------------
nnoremap + <C-a>
nnoremap - <C-x>
xnoremap + g<C-a>
xnoremap - g<C-x>

"-----------------------------
" Readline-like mappings
"-----------------------------
" - Ctrl-a - go to the start of line
" - Ctrl-e - go to the end of the line
nnoremap <C-a> 0
nnoremap <C-e> $
inoremap <C-a> <C-o>0
inoremap <C-e> <C-o>$
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
" - Alt-b  - back a word
" - Alt-f  - forward a word
" - Alt-BS - delete backward word
" - Alt-d  - delete forward word
inoremap <A-b>  <C-Left>
inoremap <A-f>  <C-Right>
inoremap <A-BS> <C-w>
inoremap <A-d>  <C-o>dw
cnoremap <A-b>  <C-Left>
cnoremap <A-f>  <C-Right>
cnoremap <A-BS> <C-w>
cnoremap <A-d>  <C-Right><C-w>

"-----------------------------
" Grep mappings
"-----------------------------
nnoremap <Leader>/ :silent grep<Space>
nnoremap gs :silent grep <C-r><C-w><CR>
xnoremap gs "sy:silent grep <C-r>s<CR>

"-----------------------------
" Find & replace helpers
"-----------------------------
" - Star search that does not move forward to the next match
nnoremap <silent> g* :let @/='\<'.expand('<cword>').'\>'<CR>
xnoremap <silent> g* "sy:let @/=@s<CR>

" - Find that does an immediate replace on the match.
nnoremap <silent> \c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> \c "sy:let @/=@s<CR>cgn
" Accept/reject helpers after completing a \c cgn-based find & replace
" operation.
"
" - Go to the next find match and highlight it.
nnoremap <CR> gnzz
" - Accept the change and go to the next match and highlight it.
xmap <CR> .<Esc>gnzz
" - Reject the change and go to the next match and highlight it.
xnoremap ! <Esc>ngnzz

" - Find and replace within the current file.
nnoremap \s :%s/<C-r><C-w>//<Left>
xnoremap \s "sy:%s/<C-r>s//<Left>

" - Project-wide find and replace using grep.
nnoremap \S
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :let &grepprg=&grepprg . ' -w'<CR>
  \ :silent grep <C-r><C-w><CR>
  \ :let &grepprg='rg --vimgrep --smart-case'<CR>
  \ :cfdo %s/<C-r>s// \| update
  \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
xnoremap \S
  \ "sy\|
  \ :silent grep <C-r>s<CR>
  \ :cfdo %s/<C-r>s// \| update
  \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
