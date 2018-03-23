" Hints:    https://bluz71.github.io/2018/03/12/vim-hints.html
" Tips:     https://bluz71.github.io/2017/05/15/vim-tips-tricks.html
" Plugins:  https://bluz71.github.io/2017/05/21/vim-plugins-i-like.html
" Mappings: https://bluz71.github.io/2017/06/14/a-few-vim-tmux-mappings.html

"===========================================================
" SETTINGS
"===========================================================

" We want syntax highlighting on.
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
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set colorcolumn=81,82
set conceallevel=2
set complete=.,w,b
set completeopt-=preview
set dictionary=/usr/share/dict/words
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
set pumheight=35      " Height of complete list
" Ruby performance is terrible with regexpengine=2, see:
"   https://github.com/vim/vim/issues/282
"   https://github.com/vim-ruby/vim-ruby/issues/243
set regexpengine=1
set relativenumber    " Show relative numbers
set ruler
set shiftwidth=4
set showbreak=\\\\\   " Use this to wrap long lines
set smartcase         " Case-smart searching
set smarttab
set splitbelow        " Split below current window
set splitright        " Split window to the right
set synmaxcol=200     " Only syntax highlight for 200 chars (for performance)
set t_Co=256          " 256 color support
set tabstop=4
set textwidth=79
set timeoutlen=2500   " Give some time for multi-key mappings
" Don't set ttimeoutlen to zero otherwise it will break terminal cursor block
" to I-beam and back functionality set by the t_SI and t_EI variables below.
set ttimeoutlen=10
set ttyfast
" Set the persistent undo directory on temporary private fast storage.
let s:undoDir = "/tmp/.undodir_" . $USER
if !isdirectory(s:undoDir)
    call mkdir(s:undoDir, "", 0700)
endif
let &undodir=s:undoDir
set undofile          " Maintain undo history
set updatetime=1000
set viminfo=          " No backups
set wildmenu
set wildmode=full
set wrap              " Wrap long lines

" Certain options only work in Neovim whilst others only work in Vim.
" Neovim has a Whitespace highlight group, Vim does not.
if has("nvim")
    " Set 'guicursor' explicitly; needed for shape-changing to work in xterm.
    " set guicursor=n-v-c-sm:block-Cursor,i-ci-ve:ver25-Cursor,r-cr-o:hor20-Cursor
    set guicursor=n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20
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

" Set default value for the global variables.
"
let g:listMode = 1

" Toggle spelling mode and add the dictionary to the completion list of
" sources if spelling mode has been entered, otherwise remove it when
" leaving spelling mode.
"
function! Spelling()
    setlocal spell!
    if &spell
        set complete+=kspell
        echo "Spell mode enabled"
    else
        set complete-=kspell
        echo "Spell mode disabled"
    endif
endfunction

" Toggle special characters list display.
"
function! Listing()
    if &filetype == "go"
        if g:listMode == 1
            set listchars=eol:$,tab:>-,trail:-
            highlight SpecialKey ctermfg=12 guifg=#78c2ff
            let g:listMode = 0
        else
            set listchars=tab:\¦\ 
            highlight SpecialKey ctermfg=235 guifg=#262626
            let g:listMode = 1
        endif
        return
    endif

    " Note, Neovim has a Whitespace highlight group, Vim does not.
    if has("nvim")
        if g:listMode == 1
            set listchars=eol:$,tab:>-,trail:-
            highlight Whitespace ctermfg=12 guifg=#78c2ff
            let g:listMode = 0
        else
            set listchars=tab:\ \ ,trail:-
            highlight Whitespace ctermfg=235 guifg=#262626
            let g:listMode = 1
        endif
    else
        set list!
    endif
endfunction

" Toggle macro mode. For maximum performance, when invoking a macro, it is
" best to disable file auto-saving.
"
function! MacroMode()
    let l:autosave = 1
    set lazyredraw!
    if exists('#autoSave#TextChanged')
        autocmd! autoSaveAndRead TextChanged,InsertLeave,FocusLost *
        let l:autosave = 0
    else
        autocmd autoSaveAndRead TextChanged,InsertLeave,FocusLost * silent! wall
    endif
    if l:autosave == 1
        echo "Enabled auto-save"
    else
        echo "Disabled auto-save"
    endif
endfunction

" Upon entering the NERDTree window do a root directoy refresh to automatically
" pick up any file or directory changes.
"
function! NERDTreeRefresh()
    if &filetype == "nerdtree"
        silent exe substitute(mapcheck("R"), "<CR>", "", "")
    endif
endfunction

" Don't set colorcolumn and IndentLine when in Vim diff.
"
function! DiffStyling()
    if &diff
        setlocal conceallevel=0
        setlocal colorcolumn=0
        highlight Visual ctermfg=251 guifg=#c6c6c6
    endif
endfunction


"===========================================================
" TERMINAL CONFIGURATION
"===========================================================

if !has("gui_running") && !has("nvim")
    " Note, Neovim cursor shape and 24-bit true colors work without any
    " help required; the following 'help' is for terminal Vim only. 

    " if tmux
    if &term == 'screen-256color'
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
        " Make CTRL-Left/Right work inside tmux.
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
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
let mapleader      = ","
let maplocalleader = " "
" Map Ctrl-c to be 'esc', handy for touchbar only Macbooks.
nnoremap <C-c>     <Esc>
inoremap <C-c>     <Esc>
" Enter command mode via ';'
noremap ;          :
" Make dot work on visual line selections.
xnoremap .         :norm.<CR>
" Y should behave like D and C, from cursor till end of line.
noremap Y          y$
" Center search matches when navigating.
noremap n          nzz
noremap N          Nzz
" Confirm quit.
noremap <C-q>      :confirm qall<CR>
" Delete previous word, when in insert mode, via Ctrl-b.
inoremap <C-b>     <C-O>diw
if has("nvim")
    " Make escape work in the Neovim terminal.
    tnoremap <Esc> <C-\><C-n>
endif

"-----------------------------
" Navigation mappings
"-----------------------------
nnoremap <C-h>     <C-w>h
nnoremap <C-j>     <C-w>j
nnoremap <C-k>     <C-w>k
nnoremap <C-l>     <C-w>l
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

"-----------------------------
" Window managment mappings
"-----------------------------
nnoremap <silent> <leader>s  :split<CR>
nnoremap <silent> <leader>-  :new<CR>
nnoremap <silent> <leader>v  :vsplit<CR>
nnoremap <silent> <leader>\| :vnew<CR>
nnoremap <silent> <leader>q  :close<CR>
nnoremap <silent> <leader>t  :$tabnew<CR>
nnoremap <silent> <C-g>s     :split<CR>
nnoremap <silent> <C-g>-     :new<CR>
nnoremap <silent> <C-g>v     :vsplit<CR>
nnoremap <silent> <C-g>\|    :vnew<CR>
nnoremap <silent> <C-g>q     :close<CR>
nnoremap <silent> <C-g>t     :$tabnew<CR>
inoremap <silent> <C-g>s     <Esc>:split<CR>
inoremap <silent> <C-g>-     <Esc>:new<CR>
inoremap <silent> <C-g>v     <Esc>:vsplit<CR>
inoremap <silent> <C-g>\|    <Esc>:vnew<CR>
inoremap <silent> <C-g>q     <Esc>:close<CR>
inoremap <silent> <C-g>t     <Esc>:$tabnew<CR>
nnoremap <leader>1           1gt
nnoremap <leader>2           2gt
nnoremap <leader>3           3gt
nnoremap <leader>4           4gt
nnoremap <leader>5           5gt
nnoremap <leader>6           6gt
nnoremap <leader>7           7gt
nnoremap <leader>8           8gt
nnoremap <leader>9           9gt
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
nnoremap <leader>=           <C-w>=
nnoremap <leader>R           <C-w>r
" Zoom the current file into a standalone new tab.
nnoremap <silent> <leader>z :tab split<CR>
if has("nvim")
    tnoremap <silent> <C-g>s  <C-\><C-N>:split<CR>
    tnoremap <silent> <C-g>-  <C-\><C-N>:new<CR>
    tnoremap <silent> <C-g>v  <C-\><C-N>:vsplit<CR>
    tnoremap <silent> <C-g>\| <C-\><C-N>:vnew<CR>
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
" Double up function key mappings with <localleader>+number mappings for
" touchbar Macbooks which have no physical function keys.
noremap <F1>            :set relativenumber!<CR>
noremap <localleader>1  :set relativenumber!<CR>
noremap <F2>            :w<CR>
noremap <localleader>2  :w<CR>
noremap <F3>            :%retab<CR> :%s/\s\+$//<CR>
noremap <localleader>3  :%retab<CR> :%s/\s\+$//<CR>
" 'qq' starts a macro recording, 'q' stops it, <F4> and Q runs the macro.
noremap <F4>            @q
noremap <localleader>4  @q
nnoremap Q              @q
" Execute macro 'q' over the visual selection.
xnoremap Q              :'<,'> :normal @q<CR>
nnoremap <F5>           :call Spelling()<CR>
nnoremap <localleader>5 :call Spelling()<CR>
nnoremap <F6>           :source $MYVIMRC<CR>
nnoremap <localleader>6 :source $MYVIMRC<CR>
nnoremap <F7>           :call MacroMode()<CR>
nnoremap <localleader>7 :call MacroMode()<CR>
nnoremap <F8>           :set paste<CR>o<C-r>*<Esc>:set nopaste<CR>
nnoremap <localleader>8 :set paste<CR>o<C-r>*<Esc>:set nopaste<CR>
inoremap <F8>           <C-o>:set paste<CR><C-o>o<C-r>*<C-o>:set nopaste<CR>
"<F9> - unused
nnoremap <localleader>9 :set hlsearch!<CR>
"<F10> - unused
nnoremap <localleader>0 :call Listing()<CR>
nnoremap <F11>          :set hlsearch!<CR>
nnoremap <F12>          :call Listing()<CR>

"-----------------------------
" Misc mappings
"-----------------------------
noremap <leader>Q        gqip
nnoremap <leader><Space> za
nnoremap <localleader>s  :syntax sync fromstart<CR>
noremap <leader>y        :let @0=getreg('*')<CR>
" Regenerate tags file.
if filereadable('Gemfile')
    " This looks like a Ruby project.
    nnoremap <localleader>c :call system("ripper-tags -R")<CR>
else
    nnoremap <localleader>c :call system("ctags -R")<CR>
endif
" Remap refresh from Ctrl-l, now taken by split navigation, to Alt-l.
if has("gui_running") || has("nvim")
    nnoremap <A-l>       :redraw!<CR>
else
    nnoremap l         :redraw!<CR>
endif
" Nicer completion mappings when in insert mode.
"  ] - complete from tags file
"  k - dictionary completion
"  l - complete line
inoremap <C-]>           <C-x><C-]>
inoremap <C-k>           <C-x><C-k>
inoremap <C-l>           <C-x><C-l>
" Replace search term under cursor, dot repeats the change.
nnoremap c* *Ncgn
nnoremap c# #NcgN
" Nicer increment and decrement mappings.
noremap +                <C-a>
noremap -                <C-x>
xnoremap +               g<C-a>
xnoremap -               g<C-x>
" ~/.inputrc like motions in command mode.
cnoremap <C-a>           <Home>
cnoremap <C-e>           <End>
cnoremap <A-b>           <C-Left>
cnoremap <A-f>           <C-Right>
" Skeleton/snippet support.
let $VIMHOME = $HOME . "/.vim"
nnoremap <leader>khtml   :read $VIMHOME/skeletons/skeleton.html<CR>
nnoremap <leader>kscript :read $VIMHOME/skeletons/skeleton.script<CR>


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
" Niceties
"-----------------------------
Plug 'bluz71/vim-moonfly-colors'
    let g:moonflySpellInverse   = 1
    let g:moonflyCursorColor    = 1
    let g:moonflyTerminalColors = 1
Plug 'bluz71/vim-moonfly-statusline'
Plug 'rakr/vim-one'
Plug 'nelstrom/vim-visual-star-search'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'Yggdroot/indentLine'
    let g:indentLine_char       = '¦'
    let g:indentLine_color_term = 235
    let g:indentLine_color_gui  = "#262626"
    let g:indentLine_faster     = 1
    let g:indentLine_setConceal = 0
Plug 'ervandew/supertab'
    " Play nice with other plugins and force top-to-bottom tab completion.
    let g:SuperTabDefaultCompletionType        = "context"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"
Plug 'rhysd/clever-f.vim'
    let g:clever_f_across_no_line    = 1
    let g:clever_f_timeout_ms        = 3000
    let g:clever_f_mark_cursor_color = "IncSearch"
Plug 'gcmt/taboo.vim'
    let g:taboo_tab_format = " tab:%N%m "
Plug 'tommcdo/vim-lion'
    let g:lion_squeeze_spaces = 1

"-----------------------------
" File management plugins
"-----------------------------
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'nixprime/cpsm', { 'do': './install.sh' }
    " Use rg in CtrlP for listing files, very fast and respects .gitignore.
    let g:ctrlp_user_command           = 'rg %s --files --color=never --glob ""'
    " Using rg is fast, we don't need to cache.
    let g:ctrlp_use_caching            = 0
    " The match should be at the top of the list.
    let g:ctrlp_match_window_reversed  = 0
    " Don't jump to a different tab.
    let g:ctrlp_switch_buffer          = 'e'
    " Syntax highlight funky matches
    let g:ctrlp_funky_syntax_highlight = 1
    " High quality, high performance CtrlP matcher.
    let g:ctrlp_match_func = { 'match': 'cpsm#CtrlPMatch' }
    nnoremap <localleader>/            :CtrlPBuffer<CR>
    nnoremap <localleader>m            :CtrlPMRUFiles<CR>
    nnoremap <localleader>f            :CtrlPFunky<CR>
    " ~/dotfiles/vim/after/plugin/ctrlp.vim - custom mappings
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    " Replace arrows with text characters; not all terminal and font
    " combinations provide arrows.
    let g:NERDTreeDirArrowExpandable  = "+"
    let g:NERDTreeDirArrowCollapsible = "~"
    let NERDTreeHijackNetrw           = 0
    let NERDTreeStatusline            = " NERDTree "
    noremap <silent> <leader>n        :NERDTreeToggle<CR> <C-w>=
    noremap <silent> <leader>f        :NERDTreeFind<CR> <C-w>=
    autocmd! BufEnter * call NERDTreeRefresh()
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
    let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : ">",
                \ "Staged"    : "=",
                \ "Dirty"     : "*",
                \ "Untracked" : "?",
                \ "Renamed"   : "!"
                \ }
    let g:NERDTreeUpdateOnCursorHold = 0
Plug 'tpope/vim-vinegar'
    nmap \ <Plug>VinegarUp
Plug 'jlanzarotta/bufexplorer'
    let g:bufExplorerFindActive       = 0
    let g:bufExplorerShowRelativePath = 1
    let g:bufExplorerSortBy           = 'name'
    noremap <leader>l                 :BufExplorer<CR>
Plug 'mhinz/vim-grepper'
    let g:grepper      = {}
    runtime autoload/grepper.vim
    let g:grepper.jump = 1
    let g:grepper.stop = 500
    noremap <leader>gr :GrepperRg<Space>
    noremap <leader>gw :GrepperRg<Space>"\b<cword>\b"<CR>

"-----------------------------
" Language/framework plugins
"-----------------------------
Plug 'sheerun/vim-polyglot'
    let g:go_highlight_functions            = 1
    let g:go_highlight_function_calls       = 1
    let g:go_highlight_types                = 1
    let g:go_highlight_operators            = 1
    let g:go_highlight_build_constraints    = 1
    let g:jsx_ext_required                  = 0
    let g:polyglot_disabled                 = ['yaml']
    let g:rubycomplete_buffer_loading       = 1
    let g:rubycomplete_classes_in_global    = 1
    let g:rubycomplete_rails                = 1
    let g:ruby_indent_access_modifier_style = 'indent'
    let g:vim_markdown_conceal              = 0
Plug 'slashmili/alchemist.vim'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'tpope/vim-bundler'
    " Run 'gem ctags' to generate ctags for installed gems (required just once).
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
    " ~/dotfiles/vim/after/plugin/projectionist.vim - custom projections & mappings
    nnoremap <leader>a  :A<CR>
Plug 'neomake/neomake'
    "let g:neomake_<<language>>_enabled_makers = ["<<maker>>"]
    let g:neomake_open_list        = 1
    let g:neomake_error_sign       = {'text': '->'}
    let g:neomake_warning_sign     = {'text': '->'}
    let g:neomake_info_sign        = {'text': '->'}
    let g:neomake_message_sign     = {'text': '->'}
    nnoremap <silent> <leader>m    :Neomake<CR>
    nnoremap <silent> <leader><BS> :sign unplace *<CR>:set signcolumn=auto<CR>
    autocmd! BufWritePost *.{js,md} Neomake
Plug 'janko-m/vim-test'
    nnoremap <silent> <localleader>t  :TestNearest<CR>
    nnoremap <silent> <localleader>Tf :TestFile<CR>
    nnoremap <silent> <localleader>Tl :TestLast<CR>
    nnoremap <silent> <localleader>Ts :TestSuite<CR>
    if has("nvim")
        let test#strategy = "neovim"
    endif
Plug 'tpope/vim-fugitive'
    noremap <silent> <leader>gb :Gblame<CR>
    noremap <silent> <leader>gd :Gdiff<CR>
    noremap <silent> <leader>gs :Gstatus<CR>

"-----------------------------
" tmux support
"-----------------------------
Plug 'christoomey/vim-tmux-navigator'
if &term == 'screen-256color'
    " Seamless CTRL-h/j/k/l navigation between Vim splits  and tmux panes.
    " Note, only set up mappings if running inside tmux.
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
endif

"-----------------------------
" Tim Pope plugins
"-----------------------------
Plug 'tpope/vim-abolish'
    " ~/dotfiles/vim/after/plugin/abolish.vim - list of abbreviations
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-sleuth'
    " Due to a weird interaction between sleuth and ragtag, sleuth MUST be
    " loaded before ragtag.
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
    " ~/dotfiles/vim/after/plugin/unimpaired.vim - custom mappings

" Finalize vim-plug.
call plug#end()


" Load up the match it plugin which provides smart % XML/HTML matching.
runtime macros/matchit.vim


"===========================================================
" AUTOCMDS
"===========================================================

" Custom settings per language by file type.
"
augroup languageCustomizationsByType
    " Note, 'autocmd!' is used to clear out any existing definitions in
    " this auto-group. This prevents duplicate entries upon a live vimrc
    " reload.
    autocmd!
    autocmd FileType c,cpp          setlocal cindent foldmethod=syntax
    autocmd FileType css,scss       let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
    autocmd FileType eelixir        setlocal matchpairs=(:),{:},[:]
    autocmd FileType eruby          setlocal formatoptions=cq matchpairs=(:),{:},[:]
    " Setup indent lines for tab formatted Golang code. Note, the IndentLine 
    " plugin will not show markers for tab formatted code, so we need to mimic
    " what that plugin does here using listchars and highlighting.
    autocmd FileType go             setlocal list listchars=tab:\¦\ 
    autocmd FileType go             highlight SpecialKey ctermfg=234 guifg=#1c1c1c
    " Match it navigation is broken for HTML, this Stack Overflow tip fixes it.
    autocmd FileType html           let b:match_words = '<\(\w\w*\):</\1,{:}'
    autocmd FileType java           setlocal cindent cinoptions+=j1 foldmethod=syntax
    autocmd FileType javascript.jsx setlocal formatoptions=cq
    autocmd FileType json           setlocal conceallevel=0
    autocmd FileType markdown       setlocal formatoptions=tqln
    autocmd FileType markdown       syntax sync fromstart
    autocmd FileType ruby           setlocal formatoptions=cq
    autocmd FileType scss           let g:indentLine_faster=0
augroup END

" Custom settings per language by file extension.
"
augroup languageCustomizationsByExtension
    autocmd!
    autocmd BufEnter *.{hh,cc,icc,tcc} set filetype=cxx
    autocmd BufEnter *.html.erb        set omnifunc=htmlcomplete#CompleteTags
augroup END

" Style and behaviour customizations for certain modes and window types.
"
augroup styleAndBehaviourCustomizations
    autocmd!
    autocmd BufWinEnter quickfix        setlocal cursorline colorcolumn=0
    autocmd BufWinEnter \[BufExplorer\] setlocal colorcolumn=0
    autocmd BufWinLeave \[BufExplorer\] setlocal colorcolumn=81,82
    autocmd FileType nerdtree,netrw     setlocal conceallevel=0 colorcolumn=0 matchpairs=
    autocmd FilterWritePre *            call DiffStyling()
    autocmd FileType *                  IndentLinesReset
    autocmd Syntax *                    IndentLinesReset
    autocmd VimResized *                wincmd =
    if has("nvim")
        autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber
        autocmd TermOpen * startinsert
        autocmd BufEnter   term://* startinsert
        " autocmd VimLeave * set guicursor=a:block-lCursor
        autocmd VimLeave * set guicursor=a:block
    endif
augroup END

" Autosave and autoread behaviour.
"
augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold *                        silent! checktime
augroup END

"===========================================================
" COLOR SCHEME
"===========================================================

" set termguicolors
colorscheme moonfly
