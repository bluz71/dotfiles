" Hints:    https://bluz71.github.io/2018/03/12/vim-hints.html
" Tips:     https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
" Plugins:  https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html
" Mappings: https://bluz71.github.io/2017/06/14/a-few-vim-tmux-mappings.html

"===========================================================
" SETTINGS
"===========================================================

" Enable syntax highlighting.
"
syntax on


" General vim settings.
"
set autoindent        " Indented text
set autoread          " Pick up external changes to files
set autowrite         " Write files when navigating with :next/:previous
set background=dark
set backspace=indent,eol,start
set belloff=all       " Bells are annoying
set breakindent       " Wrap long lines *with* indentation
set breakindentopt=shift:2
if has("unnamedplus")
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set colorcolumn=81,82
set conceallevel=2
set complete=.,w,b
set completeopt=menu,menuone,noselect,noinsert
set dictionary=/usr/share/dict/words
if has('nvim-0.3.2') || has("patch-8.1.0360")
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif
set expandtab
set foldlevelstart=20
set foldmethod=indent " Simple and fast
set foldtext=""
set formatoptions=cq
set gdefault          " Always do global substitutes
set history=200       " Keep 200 changes of undo history
set infercase         " Smart casing when completing
set ignorecase        " Search in case-insensitively
set incsearch         " Go to search results immediately
set laststatus=2      " We want a statusline
set matchpairs=(:),{:},[:]
set mouse=a           " Mouse support in the terminal
set mousehide         " Hide mouse when typing text
set nobackup          " No backup files
set nocompatible      " No Vi support
set noexrc            " Disable reading of working directory vimrc files
set nohlsearch        " Don't highlight search results by default
set nojoinspaces      " No to double-spaces when joining lines
set noshowcmd         " No to showing command in bottom-right corner
set noshowmatch       " No jumping jumping cursors when matching pairs
set noshowmode        " No to showing mode in bottom-left corner
set noswapfile        " No backup files
set nowrapscan        " Don't wrap searches around
set number            " Show line numbers
set nrformats=        " No to oct/hex support when doing CTRL-a/x
set path=**
set pumheight=20      " Height of complete list
" Ruby performance is terrible with regexpengine=2, see:
"   https://github.com/vim/vim/issues/282
"   https://github.com/vim-ruby/vim-ruby/issues/243
set regexpengine=1
set relativenumber    " Show relative numbers
set ruler
set shiftwidth=4
set showbreak=↳       " Use this to wrap long lines
set smartcase         " Case-smart searching
set smarttab
set splitbelow        " Split below current window
set splitright        " Split window to the right
set synmaxcol=500     " Syntax highlight first 500 chars, for performance
set t_Co=256          " 256 color support
set tabstop=4
" Be aware, termguicolors results in `:terminal` colors that are slightly off.
"   https://github.com/neovim/neovim/issues/7018
" if has("termguicolors")
"     set termguicolors " Enable 24-bit color support if available
" endif
set textwidth=80
set timeoutlen=1500   " Give some time for multi-key mappings
" Don't set ttimeoutlen to zero otherwise it will break terminal cursor block
" to I-beam and back functionality set by the t_SI and t_EI variables.
set ttimeoutlen=10
set ttyfast
" Set the persistent undo directory on temporary private fast storage.
let s:undoDir="/tmp/.undodir_" . $USER
if !isdirectory(s:undoDir)
    call mkdir(s:undoDir, "", 0700)
endif
let &undodir=s:undoDir
set undofile          " Maintain undo history
set updatetime=300
set viminfo=          " No backups
set wildcharm=<Tab>   " Defines the trigger for 'wildmenu' in mappings
set wildmenu
set wildmode=full
set wrap              " Wrap long lines

" Customizations per Neovim and Vim.
if has("nvim")
    set inccommand=nosplit
    set list
    set listchars=tab:\ \ ,trail:-
else
    set cryptmethod=blowfish2
    set listchars=eol:$,tab:>-,trail:-
    set ttymouse=xterm2
endif


"===========================================================
" FUNCTIONS
"===========================================================

" ~/dotfiles/vim/autoload - custom functions


"===========================================================
" TERMINAL CONFIGURATION
"===========================================================

if !has("gui_running") && !has("nvim")
    " Note, Neovim cursor shape and 24-bit true colors work without any
    " help required; the following 'help' is for terminal Vim only.

    " if tmux
    if &term == "screen-256color"
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
        " Make Vim *set termguicolors* work inside tmux.
        set t_8b=[48;2;%lu;%lu;%lum
        set t_8f=[38;2;%lu;%lu;%lum
    " else not tmux
    else
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\e[6 q"
        let &t_EI = "\e[2 q"
    endif
endif


"===========================================================
" MAPPINGS
"===========================================================

"-----------------------------
" Core mappings
"-----------------------------
let mapleader = ","
" Enter command mode via ';'
noremap ; :
" Make dot work on visual line selections.
xnoremap . :norm.<CR>
" 'qq' starts a macro recording, 'q' stops it, Q runs the macro.
nnoremap Q @q
" Execute macro 'q' over the visual selection.
xnoremap Q :'<,'> :normal @q<CR>
" Y should behave like D and C, from cursor till end of line.
noremap Y y$
if has("nvim")
    " Make escape work in the Neovim terminal.
    tnoremap <Esc> <C-\><C-n>
endif
" Confirm quit.
noremap <silent> <C-q> :confirm qall<CR>

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
" Mapping that scrolls the window when wrapping is in effect.
nnoremap [z zH
nnoremap ]z zL

"-----------------------------
" Window managment mappings
"-----------------------------
nnoremap <silent> <Leader>s  :split<CR>
nnoremap <silent> <Leader>v  :vsplit<CR>
nnoremap <silent> <Leader>-  :botright new<CR><C-w>=
nnoremap <silent> <Leader>\| :botright vnew<CR><C-w>=
nnoremap <silent> <Leader>b  :botright new<CR><C-w>=:terminal<CR>
nnoremap <silent> <Leader>q  :close<CR>
nnoremap <silent> <Leader>t  :$tabnew<CR>
nnoremap <silent> <C-g>s     :split<CR>
nnoremap <silent> <C-g>v     :vsplit<CR>
nnoremap <silent> <C-g>-     :botright new<CR><C-w>=
nnoremap <silent> <C-g>\|    :botright vnew<CR><C-w>=
nnoremap <silent> <C-g>b     :botright new<CR><C-w>=:terminal<CR>
nnoremap <silent> <C-g>q     :close<CR>
nnoremap <silent> <C-g>t     :$tabnew<CR>
inoremap <silent> <C-g>s     <Esc>:split<CR>
inoremap <silent> <C-g>v     <Esc>:vsplit<CR>
inoremap <silent> <C-g>-     <Esc>:botright new<CR><C-w>=
inoremap <silent> <C-g>\|    <Esc>:botright vnew<CR><C-w>=
inoremap <silent> <C-g>b     <Esc>:botright new<CR><C-w>=:terminal<CR>
inoremap <silent> <C-g>q     <Esc>:close<CR>
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
    tnoremap <silent> <C-g>s  <C-\><C-N>:split<CR>
    tnoremap <silent> <C-g>v  <C-\><C-N>:vsplit<CR>
    tnoremap <silent> <C-g>-  <C-\><C-N>:botright new<CR><C-w>=
    tnoremap <silent> <C-g>\| <C-\><C-N>:botright vnew<CR><C-w>=
    tnoremap <silent> <C-g>b  <C-\><C-N>:botright new<CR><C-w>=<C-\><C-N>:terminal<CR>
    tnoremap <silent> <C-g>q  <C-\><C-N>:close<CR>
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
"
" Double up function key mappings with <Space>+number mappings for
" touchbar Macbooks which have no physical function keys.
"<F1> - unused
nnoremap <F2>     :w<CR>
nnoremap <Space>2 :w<CR>
nnoremap <F3>     :%retab<CR> :%s/\s\+$//<CR>
nnoremap <Space>3 :%retab<CR> :%s/\s\+$//<CR>
nnoremap <F4>     :%s/ /_<CR>
nnoremap <Space>4 :%s/ /_<CR>
nnoremap <F5>     :call spelling#Toggle()<CR>
nnoremap <Space>5 :call spelling#Toggle()<CR>
nnoremap <F6>     :source $MYVIMRC<CR>
nnoremap <Space>6 :source $MYVIMRC<CR>
nnoremap <F7>     :set lazyredraw!<CR>:call AutoSaveToggle()<CR>
nnoremap <Space>7 :set lazyredraw!<CR>:call AutoSaveToggle()<CR>
nnoremap <F8>     :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
nnoremap <Space>8 :echo synIDattr(synID(line("."), col("."), 1), "name")<CR>
"<F9> - unused
nnoremap <Space>9 :set hlsearch!<CR>
"<F10> - unused
nnoremap <Space>0 :call listing#Toggle()<CR>
nnoremap <F11>    :set hlsearch!<CR>
nnoremap <F12>    :call listing#Toggle()<CR>

"-----------------------------
" Misc mappings
"-----------------------------
"
" Format current paragraph.
nnoremap <Leader>Q gqip
" Fold the current indent.
nnoremap <Leader>z za
" Recalculate syntax highlighting for the entire file.
nnoremap <Space>S  :syntax sync fromstart<CR>
" Center navigation commands.
noremap n  nzz
noremap N  Nzz
noremap ]s ]szz
noremap [s [szz
" Yank/paste/delete helper mappings.
" - Copy into the 'y' register from the clipboard register
noremap  <Leader>* :let @y=@*<CR>
" - Yank into the 'y' register
noremap <Leader>y  "yy
" - Paste from the 'y' register
noremap <Leader>p  "yp
noremap <Leader>P  "yP
" - Delete into the 'black hole' register
noremap <Leader>x  "_x
noremap <Leader>d  "_d
" Remap refresh from Ctrl-l, now taken by split navigation, to Alt-l.
if has("gui_running") || has("nvim")
    nnoremap <A-l> :redraw!<CR>
else
    nnoremap l :redraw!<CR>
endif
" Nicer completion mappings when in insert mode.
" - ]     - 'tags' file completion
" - Space - context aware language completion (via 'omnifunc' setting)
" - c     - context aware term completion (repeat to continue adding matches)
" - d     - dictionary completion (via 'dictionary' setting)
" - f     - file path completion
" - l     - line completion (repeat an existing line)
inoremap <C-]>     <C-x><C-]>
inoremap <C-Space> <C-x><C-o>
inoremap <C-c>     <C-x><C-p>
inoremap <C-d>     <C-x><C-k>
inoremap <C-f>     <C-x><C-f>
inoremap <C-l>     <C-x><C-l>
" Find & replace helper mappings.
" - Star search that does not move forward to the next match
nnoremap <silent> g* :let @/='\<'.expand('<cword>').'\>'<CR>
xnoremap <silent> g* "sy:let @/=@s<CR>
" - Star search that does an immediate change on the match
nnoremap <silent> \c :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> \c "sy:let @/=@s<CR>cgn
" - Star search and substitute within the current file
nnoremap \s :let @s='\<'.expand('<cword>').'\>'<CR>:%s/<C-r>s//<Left>
xnoremap \s "sy:%s/<C-r>s//<Left>
" - Project-wide star search and substitute using Grepper plugin
nnoremap \S
  \ :let @s='\<'.expand('<cword>').'\>'<CR> \|
  \:Grepper -cword -noprompt<CR> \|
  \:cfdo %s/<C-r>s// \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
xmap \S
  \ "sy \|
  \gvgr
  \:cfdo %s/<C-r>s// \| update
  \<Left><Left><Left><Left><Left><Left><Left><Left><Left><Left>
" Accept/reject helpers after completing a '\c' cgn-based change operation
" - Go to the next match and highlight it
nnoremap <Enter> gnzz
" - Accept the change and go to the next match and highlight it
xmap <Enter>     .<Esc>gnzz
" - Reject the change and go to the next match and highlight it
xnoremap !       <Esc>ngnzz
" Nicer increment and decrement mappings.
nnoremap + <C-a>
nnoremap - <C-x>
xnoremap + g<C-a>
xnoremap - g<C-x>
" ~/.inputrc (aka Readline) like mappings for insert mode.
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

"===========================================================
" PLUGINS
"===========================================================

" Automatically install vim-plug and run PlugInstall if vim-plug is not found.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Initialize vim-plug.
call plug#begin('~/.vim/plugged')

"-----------------------------
" Styling related plugings
"-----------------------------
Plug 'bluz71/vim-moonfly-colors'
    " ~/dotfiles/vim/plugin/moonfly-colors.vim - options
Plug 'bluz71/vim-moonfly-statusline'
    " ~/dotfiles/vim/plugin/moonfly-statusline.vim - options
Plug 'Yggdroot/indentLine'
    " ~/dotfiles/vim/plugin/indentLine.vim - options
Plug 'gcmt/taboo.vim'
    " ~/dotfiles/vim/plugin/taboo.vim - options

"-----------------------------
" General behavior plugins
"-----------------------------
Plug 'nelstrom/vim-visual-star-search'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'tommcdo/vim-lion'
    " ~/dotfiles/vim/plugin/lion.vim - options
Plug 'chaoren/vim-wordmotion'
    " ~/dotfiles/vim/after/plugin/wordmotion.vim - overrides
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'rstacruz/vim-closer'
Plug 'ajh17/VimCompletesMe'
Plug '907th/vim-auto-save'
    " ~/dotfiles/vim/plugin/auto-save.vim - options
Plug 'rhysd/clever-f.vim'
    " ~/dotfiles/vim/plugin/clever-f.vim - options
Plug 'mbbill/undotree'
    " ~/dotfiles/vim/plugin/undotree.vim - options, mappings
Plug 'tpope/vim-abolish'
    " ~/dotfiles/vim/after/plugin/abolish.vim - abbreviations
Plug 'tpope/vim-obsession'
    " ~/dotfiles/vim/plugin/obsession.vim - mappings
Plug 'tpope/vim-unimpaired'
    " ~/dotfiles/vim/after/plugin/unimpaired.vim - overrides

"-----------------------------
" File management plugins
"-----------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
    " ~/dotfiles/vim/plugin/fzf.vim - options, mappings
Plug 'pbogut/fzf-mru.vim'
    " ~/dotfiles/vim/plugin/fzf-mru.vim - mappings
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    " ~/dotfiles/vim/plugin/nerdtree.vim - options, mappings, function, events
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    " ~/dotfiles/vim/plugin/nerdtree-git-plugin.vim - options
Plug 'mhinz/vim-grepper'
    " ~/dotfiles/vim/plugin/grepper.vim - options, mappings
    " ~/dotfiles/vim/after/plugin/grepper.vim - overrides

"-----------------------------
" Development related plugins
"-----------------------------
Plug 'sheerun/vim-polyglot'
    " ~/dotfiles/vim/plugin/polyglot.vim - options
Plug 'HerringtonDarkholme/yats.vim', { 'for': 'typescript' }
Plug 'tpope/vim-bundler'
    " Run 'gem ctags' to generate ctags for installed gems (required just once).
Plug 'tpope/vim-rails'
    " ~/dotfiles/vim/plugin/rails.vim - mappings
Plug 'tpope/vim-projectionist'
    " ~/dotfiles/vim/plugin/projectionist.vim - mappings
Plug 'dense-analysis/ale'
    " ~/dotfiles/vim/plugin/ale.vim - options, mappings
Plug 'airblade/vim-gitgutter'
    " ~/dotfiles/vim/plugin/gitgutter.vim - options, mappings
Plug 'janko-m/vim-test'
    " ~/dotfiles/vim/plugin/test.vim - options, mappings

" Sleuth and EditorConfig will adjust style and indent either heuristically
" (former) or explicitly (later). Note, EditorConfig will take precedence if
" a .editorconfig file is found.
Plug 'tpope/vim-sleuth'
    " ~/dotfiles/vim/after/plugin/sleuth.vim - overrides
Plug 'sgur/vim-editorconfig'
Plug 'tpope/vim-fugitive'
    " ~/dotfiles/vim/plugin/fugitive.vim - mappings
Plug 'tpope/vim-ragtag'
    " ~/dotfiles/vim/plugin/ragtag.vim - mappings
Plug 'SirVer/ultisnips'
    " ~/dotfiles/vim/plugin/ultisnips.vim - options
    " ~/dotfiles/vim/UltiSnips - custom snippets

"-----------------------------
" tmux support
"-----------------------------
Plug 'christoomey/vim-tmux-navigator'
    " ~/dotfiles/vim/plugin/tmux-navigator.vim - options, mappings

"-----------------------------
" Neovim specific plugins
"-----------------------------
if has("nvim")
Plug 'bfredl/nvim-miniyank'
    " ~/dotfiles/vim/plugin/miniyank.vim - mappings
endif

" Finalize vim-plug.
call plug#end()


" Load up the match it plugin which provides smart % XML/HTML matching.
runtime macros/matchit.vim


"===========================================================
" AUTOCMDS
"===========================================================

" General customizations.
"
augroup generalCustomizations
    " Note, 'autocmd!' is used to clear out any existing definitions in
    " this auto-group. This prevents duplicate entries upon a live vimrc
    " reload.
    autocmd!
    autocmd BufWinEnter quickfix setlocal cursorline colorcolumn=0
    autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
    autocmd CmdwinEnter *        nnoremap <buffer> <CR> <CR>
    autocmd VimResized  *        wincmd =
    autocmd Syntax      *        syntax sync minlines=2000 " for performance
    " Auto-read external changes.
    autocmd CursorHold  *        silent! checktime
    " Auto-load session if it exists.
    autocmd VimEnter    * nested
      \ if argc() == 0 && filereadable('Session.vim')|
      \     source Session.vim|
      \ endif
    " Neovim terminal tweaks.
    if has("nvim")
        autocmd TermOpen *        setlocal conceallevel=0 colorcolumn=0
        autocmd TermOpen *        startinsert
        autocmd BufEnter term://* startinsert
    endif
augroup END

" Language customizations.
"
augroup languageCustomizations
    autocmd!
    " BY FILE EXTENSION
    autocmd BufEnter *.{hh,cc,icc,tcc} set filetype=cxx
    autocmd BufEnter *.html.erb        set omnifunc=htmlcomplete#CompleteTags
augroup END

" Style customizations.
"
augroup styleCustomizations
    autocmd!
    autocmd VimEnter * windo call diff#Styling()
    autocmd WinEnter * call relative_number#Activity("active")
    autocmd WinLeave * call relative_number#Activity("inactive")
augroup END

"===========================================================
" COLOR SCHEME
"===========================================================

colorscheme moonfly
