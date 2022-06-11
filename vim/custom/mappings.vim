"-----------------------------
" Leader
"-----------------------------
let mapleader = ','

"-----------------------------
" General mappings
"-----------------------------
" Enter command mode via ';'
noremap ; :
" Make dot work on visual line selections.
xnoremap . :norm.<CR>
" Y should behave like D and C, from cursor till the end of line.
noremap Y y$
" U for redo, the opposite of u for undo.
nnoremap U <C-r>
" 'qq' starts a macro recording, 'q' stops it, Q runs the macro.
nnoremap Q @q
" Execute macro 'q' over the visual selection.
xnoremap Q :'<,'> :normal @q<CR>
" Confirm quit.
noremap <silent> <C-q> :confirm qall<CR>
if has('nvim')
    " Make escape work in the Neovim terminal.
    tnoremap <Esc> <C-\><C-n>
endif
" Direct changes into the black hole register.
nnoremap c "_c
nnoremap C "_C
if &wildoptions =~# "pum"
    " Wild menu is set to popup menu, it is best to invert the meaning of
    " up/down and left/right keys since this will be more natural
    cnoremap <expr> <Up> pumvisible() ? '<Left>' : '<Up>'
    cnoremap <expr> <Down> pumvisible() ? '<Right>' : '<Down>'
    cnoremap <expr> <Left> pumvisible() ? '<Up>' : '<Left>'
    cnoremap <expr> <Right> pumvisible() ? '<Down>' : '<Right>'
endif

"-----------------------------
" Helper mappings
"-----------------------------
" Insert from the clipboard register.
" Note, use Control-q for virtual insertion (e.g insert a real tab).
inoremap <C-v> <C-r>+
" Begin a new line above the current cursor position.
inoremap <C-u> <C-o>O
" Fix syntax and redraw the screen.
nnoremap <C-l> :syntax sync fromstart<CR>:redraw<CR>
" Clone paragraph.
nnoremap cp yap<S-}>p
" Format current paragraph in normal mode.
nnoremap qp gqip$
" Format current line.
nnoremap qj gqj
" Paste from the yank register
noremap <Leader>p "0p
noremap <Leader>P "0P
" Fold the current indent.
nnoremap <Leader>z zazz
" Expand all folds.
nnoremap <Leader>Z :set nofoldenable<CR>
" Toggle crosshair, aka cusorcolumn & cursorline.
nnoremap <Leader>X :call crosshair#Toggle()<CR>
" Maximise the current file into a standalone new tab.
nnoremap <silent> <Leader>m :tab split<CR>
" Show introduction message.
nnoremap <Leader>i :intro<CR>
" Preserve visual selection when shifting.
xnoremap < <gv
xnoremap > >gv

"-----------------------------
" Navigation mappings
"-----------------------------
nnoremap <Tab> <C-w>w
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l
if has('nvim')
    " Use same mappings as above to navigate Neovim terminal splits.
    tnoremap <A-h> <C-\><C-N><C-w>h
    tnoremap <A-j> <C-\><C-N><C-w>j
    tnoremap <A-k> <C-\><C-N><C-w>k
    tnoremap <A-l> <C-\><C-N><C-w>l
endif
" Vertical movements.
nnoremap <C-j> 10j
nnoremap <C-k> 10k
" Move vertically by visual line unless preceded by a count. If a movement is
" greater than 5 then automatically add to the jumplist.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
" Navigate buffers via 'wildmenu'.
nnoremap <Leader><Tab> :buffer<Space><Tab>
" Alternate the last two files.
nnoremap <Backspace> <C-^>

"-----------------------------
" Paired mappings
"-----------------------------
nnoremap {  {zz
nnoremap }  }zz
nnoremap n  nzz
nnoremap N  Nzz
nnoremap [c [czz
nnoremap ]c ]czz
nnoremap [j <C-o>zz
nnoremap ]j <C-i>zz
nnoremap [s [szz
nnoremap ]s ]szz
nnoremap [z zH
nnoremap ]z zL

"-----------------------------
" Scroll mappings
"-----------------------------
nnoremap <C-Up>   <C-e>
nnoremap <C-Down> <C-y>

"-----------------------------
" Window managment mappings
"-----------------------------
nnoremap <silent> <Leader>s  :split<CR>:call window_traits#WinBar()<CR>
nnoremap <silent> <Leader>v  :vsplit<CR>:call window_traits#WinBar()<CR>
nnoremap <silent> <Leader>-  :botright new<CR><C-w>=:call window_traits#WinBar()<CR>
nnoremap <silent> <Leader>\| :botright vnew<CR><C-w>=:call window_traits#WinBar()<CR>
nnoremap <silent> <Leader>t  :$tabnew<CR>:call window_traits#WinBar()<CR>
nnoremap <silent> <Leader>q  :close<CR>
nnoremap <silent> <Leader>c  :cclose<CR>:lclose<CR>:pclose<CR>
nnoremap <Leader>1           1gt
nnoremap <Leader>2           2gt
nnoremap <Leader>3           3gt
nnoremap <Leader>4           4gt
nnoremap <Leader>5           5gt
nnoremap <Leader>6           6gt
nnoremap <Leader>7           7gt
nnoremap <Leader>8           8gt
nnoremap <Leader>9           9gt
nnoremap <Leader>=           <C-w>=
nnoremap <Leader>r           <C-w>r
if has('nvim')
    nnoremap <silent> <Leader>T :botright new<CR><C-w>=:terminal<CR>
endif

"-----------------------------
" Function key mappings
"-----------------------------
" Double up function key mappings with single-quote+number mappings for
" touchbar Macbooks which have no physical function keys.
if has('nvim')
    nnoremap <F1> :TSHighlightCapturesUnderCursor<CR>
    nnoremap '1   :TSHighlightCapturesUnderCursor<CR>
else
    nnoremap <F1> :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>
    nnoremap '1   :echo synIDattr(synID(line('.'), col('.'), 1), 'name')<CR>
endif
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
