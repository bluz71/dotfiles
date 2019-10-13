"-----------------------------
" Prime mappings
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
if has("nvim")
    " Make escape work in the Neovim terminal.
    tnoremap <Esc> <C-\><C-n>
endif

"-----------------------------
" Misc mappings
"-----------------------------
" Clone paragraph.
nnoremap cp yap<S-}>p
" Mapping that scrolls the window when wrapping is in effect.
nnoremap [z zH
nnoremap ]z zL
" Format current paragraph in normal mode.
nnoremap <Leader>Q gqip
" Format current paragraph in insert mode.
inoremap <C-q> <C-o>gqip<C-o>$
" Fold the current indent.
nnoremap <Leader>z za
" Recalculate syntax highlighting for the entire file.
nnoremap <Space>$ :syntax sync fromstart<CR>
" Alternate between the last two files.
nnoremap <Backspace> <C-^>
" Whilst in insert mode begin a new line above the cursor.
inoremap <C-u> <C-o>O

"-----------------------------
" Navigation mappings
"-----------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
if has("nvim")
    " Use same mappings as above to navigate Neovim terminal splits.
    tnoremap <C-h> <C-\><C-N><C-w>h
    tnoremap <C-j> <C-\><C-N><C-w>j
    tnoremap <C-k> <C-\><C-N><C-w>k
    tnoremap <C-l> <C-\><C-N><C-w>l
endif
" Move vertically by visual line unless preceded by a count. If a movement is
" greater than 5 then automatically add to the jumplist.
nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'
" Navigate buffers via 'wildmenu'.
nnoremap <Leader><Tab> :buffer<Space><Tab>
" Navigate the jumplist.
nnoremap [j <C-o>zz
nnoremap ]j <C-i>zz

"-----------------------------
" Window managment mappings
"-----------------------------
nnoremap <silent> <Leader>s  :split<CR>
nnoremap <silent> <Leader>v  :vsplit<CR>
nnoremap <silent> <Leader>-  :botright new<CR><C-w>=
nnoremap <silent> <Leader>\| :botright vnew<CR><C-w>=
nnoremap <silent> <Leader>q  :close<CR>
nnoremap <silent> <Leader>c  :cclose<CR>:pclose<CR>
nnoremap <silent> <Leader>t  :$tabnew<CR>
nnoremap <silent> <C-g>s     :split<CR>
nnoremap <silent> <C-g>v     :vsplit<CR>
nnoremap <silent> <C-g>-     :botright new<CR><C-w>=
nnoremap <silent> <C-g>\|    :botright vnew<CR><C-w>=
nnoremap <silent> <C-g>q     :close<CR>
nnoremap <silent> <C-g>c     :cclose<CR>:pclose<CR>
nnoremap <silent> <C-g>t     :$tabnew<CR>
inoremap <silent> <C-g>s     <Esc>:split<CR>
inoremap <silent> <C-g>v     <Esc>:vsplit<CR>
inoremap <silent> <C-g>-     <Esc>:botright new<CR><C-w>=
inoremap <silent> <C-g>\|    <Esc>:botright vnew<CR><C-w>=
inoremap <silent> <C-g>q     <Esc>:close<CR>
inoremap <silent> <C-g>c     <Esc>:cclose<CR>:pclose<CR>
inoremap <silent> <C-g>t     <Esc>:$tabnew<CR>
nnoremap <Leader>1           1gt
nnoremap <Leader>2           2gt
nnoremap <Leader>3           3gt
nnoremap <Leader>4           4gt
nnoremap <Leader>5           5gt
nnoremap <Leader>6           6gt
nnoremap <Leader>7           7gt
nnoremap <Leader>8           8gt
nnoremap <Leader>9           9gt
nnoremap <C-g>1              1gt
nnoremap <C-g>2              2gt
nnoremap <C-g>3              3gt
nnoremap <C-g>4              4gt
nnoremap <C-g>5              5gt
nnoremap <C-g>6              6gt
nnoremap <C-g>7              7gt
nnoremap <C-g>8              8gt
nnoremap <C-g>9              9gt
inoremap <C-g>1              <Esc>1gt
inoremap <C-g>2              <Esc>2gt
inoremap <C-g>3              <Esc>3gt
inoremap <C-g>4              <Esc>4gt
inoremap <C-g>5              <Esc>5gt
inoremap <C-g>6              <Esc>6gt
inoremap <C-g>7              <Esc>7gt
inoremap <C-g>8              <Esc>8gt
inoremap <C-g>9              <Esc>9gt
nnoremap <Leader>=           <C-w>=
nnoremap <Leader>R           <C-w>r
" Zoom the current file into a standalone new tab.
nnoremap <silent> <Leader>Z  :tab split<CR>
if has("nvim")
    nnoremap <silent> <Leader>b :botright new<CR><C-w>=:terminal<CR>
    nnoremap <silent> <C-g>b    :botright new<CR><C-w>=:terminal<CR>
    inoremap <silent> <C-g>b    <Esc>:botright new<CR><C-w>=:terminal<CR>
    " Mappings when in terminal mode.
    tnoremap <silent> <C-g>s  <C-\><C-N>:split<CR>
    tnoremap <silent> <C-g>v  <C-\><C-N>:vsplit<CR>
    tnoremap <silent> <C-g>-  <C-\><C-N>:botright new<CR><C-w>=
    tnoremap <silent> <C-g>\| <C-\><C-N>:botright vnew<CR><C-w>=
    tnoremap <silent> <C-g>b  <C-\><C-N>:botright new<CR><C-w>=<C-\><C-N>:terminal<CR>
    tnoremap <silent> <C-g>q  <C-\><C-N>:close<CR>
    tnoremap <silent> <C-g>c  <C-\><C-N>:cclose<CR><C-\><C-N>:pclose<CR>
    tnoremap <silent> <C-g>t  <C-\><C-N>:$tabnew<CR>
    tnoremap <C-g>1           <C-\><C-N>1gt
    tnoremap <C-g>2           <C-\><C-N>2gt
    tnoremap <C-g>3           <C-\><C-N>3gt
    tnoremap <C-g>4           <C-\><C-N>4gt
    tnoremap <C-g>5           <C-\><C-N>5gt
    tnoremap <C-g>6           <C-\><C-N>6gt
    tnoremap <C-g>7           <C-\><C-N>7gt
    tnoremap <C-g>8           <C-\><C-N>8gt
    tnoremap <C-g>9           <C-\><C-N>9gt
endif

"-----------------------------
" Function key mappings
"-----------------------------
" Double up function key mappings with <Space>+number mappings for
" touchbar Macbooks which have no physical function keys.
nnoremap <F1>     :set hlsearch!<CR>
nnoremap <Space>1 :set hlsearch!<CR>
nnoremap <F2>     :w<CR>
nnoremap <Space>2 :w<CR>
nnoremap <F3>     :%retab<CR>:%s/\s\+$//<CR>
nnoremap <Space>3 :%retab<CR>:%s/\s\+$//<CR>
nnoremap <F4>     :%s/ /_<CR>
nnoremap <Space>4 :%s/ /_<CR>
nnoremap <F5>     :call spelling#Toggle()<CR>
nnoremap <Space>5 :call spelling#Toggle()<CR>
nnoremap <F6>     :set showcmd!<CR>
nnoremap <Space>6 :set showcmd!<CR>
"<F7>     - unused
"<Space>7 - unused
nnoremap <F8>     :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
nnoremap <Space>8 :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
nnoremap <F9>     :set lazyredraw!<CR>:call AutoSaveToggle()<CR>
nnoremap <Space>9 :set lazyredraw!<CR>:call AutoSaveToggle()<CR>
nnoremap <Space>0 :call listing#Toggle()<CR>
nnoremap <F12>    :call listing#Toggle()<CR>

"-----------------------------
" Yank/paste/delete mappings
"-----------------------------
" - Copy into the 'y' register from the clipboard register
noremap <Leader>* :let @y=@*<CR>
" - Yank into the 'y' register
noremap <Leader>y "yy
" - Paste from the 'y' register
noremap <Leader>p "yp
noremap <Leader>P "yP
" - Delete into the 'black hole' register
noremap <Leader>x "_x
noremap <Leader>d "_d

"-----------------------------
" Center navigation mappings
"-----------------------------
noremap {  {zz
noremap }  }zz
noremap n  nzz
noremap N  Nzz
noremap ]s ]szz
noremap [s [szz

"-----------------------------
" Completion mappings
"-----------------------------
" - ]     - 'tags' file completion
" - Space - context aware omni completion (via 'omnifunc' setting)
" - b     - keyword completion from the current buffer (<C-n><C-b> to extend)
" - d     - dictionary completion (via 'dictionary' setting)
" - f     - file path completion
" - l     - line completion (repeat an existing line)
inoremap <C-]>     <C-x><C-]>
inoremap <C-Space> <C-x><C-o>
inoremap <C-b>     <C-x><C-p>
inoremap <C-d>     <C-x><C-k>
inoremap <C-f>     <C-x><C-f>
inoremap <C-l>     <C-x><C-l>
" - c - term completion that combines the sources of the 'complete' option
inoremap <expr> <C-c> pumvisible() ? "\<C-e>\<C-n>": "\<C-n>"

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
" - Alt-b  - back a word
" - Alt-f  - forward a word
" - Alt-BS - delete backward word
" - Alt-d  - delete forward word
inoremap <C-a>  <C-o>^
inoremap <C-e>  <C-o>$
inoremap <A-b>  <C-Left>
inoremap <A-f>  <C-Right>
inoremap <A-BS> <C-w>
inoremap <A-d>  <C-o>dw
" As above but for command mode.
cnoremap <C-a>  <Home>
cnoremap <C-e>  <End>
cnoremap <A-b>  <C-Left>
cnoremap <A-f>  <C-Right>
cnoremap <A-BS> <C-w>
cnoremap <A-d>  <C-Right><C-w>

"-----------------------------
" Find & replace helpers
"-----------------------------
" - Star search that does not move forward to the next match
nnoremap <silent> g* :let @/='\<'.expand('<cword>').'\>'<CR>
xnoremap <silent> g* "sy:let @/=@s<CR>
" - Star search that does an immediate change on the match
nnoremap <silent> \c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> \c "sy:let @/=@s<CR>cgn
" - Star search and substitute within the current file
nnoremap \s :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>
xnoremap \s "sy:%s/<C-r>s//<Left>
" - Project-wide star search and substitute using the Grepper plugin
nnoremap \S
  \ :let @s='\<'.expand('<cword>').'\>'<CR>
  \ :Grepper -cword -noprompt<CR>
  \ :cfdo %s/<C-r>s// \| update
  \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
xmap \S
  \ "sy \|
  \ :GrepperRg <C-r>s<CR>
  \ :cfdo %s/<C-r>s// \| update
  \ <Left><Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" Accept/reject helpers after completing a \c cgn-based change operation
" - Go to the next match and highlight it
nnoremap <Enter> gnzz
" - Accept the change and go to the next match and highlight it
xmap <Enter> .<Esc>gnzz
" - Reject the change and go to the next match and highlight it
xnoremap ! <Esc>ngnzz
