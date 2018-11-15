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
if has("unnamedplus")
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
" Be aware, termguicolors results in `:terminal` colors that are slightly off.
"   https://github.com/neovim/neovim/issues/7018
" if has("termguicolors")
"     set termguicolors " Enable 24-bit color support if available
" endif
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
    " Set 'guicursor' explicitly, needed for shape-changing to work in xterm.
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

" Toggle the highlighting of special characters.
"
function! Listing()
    if &filetype == "go"
        if g:listMode == 1
            set listchars=eol:$,tab:>-,trail:-
            highlight! link SpecialKey Function
            highlight! link Whitespace Function
            let g:listMode = 0
        else
            " Mimic indentLine plugin markers for tab-indented Go code.
            set listchars=tab:\┊\ ,trail:-
            highlight! link SpecialKey Conceal
            highlight! link Whitespace Conceal
            let g:listMode = 1
        endif
        return
    endif

    " Note, Neovim has a Whitespace highlight group, Vim does not.
    if has("nvim")
        if g:listMode == 1
            set listchars=eol:$,tab:>-,trail:-
            highlight! link Whitespace Function
            let g:listMode = 0
        else
            set listchars=tab:\ \ ,trail:-
            highlight! link Whitespace Conceal
            let g:listMode = 1
        endif
    else
        set list!
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

" Don't set colorcolumn and disable IndentLine when in Vim diff.
"
function! DiffStyling()
    if &diff
        setlocal colorcolumn=0
        :IndentLinesDisable
        highlight! link Visual VisualInDiff
    endif
endfunction


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
" 'qq' starts a macro recording, 'q' stops it, Q runs the macro.
nnoremap Q         @q
" Execute macro 'q' over the visual selection.
xnoremap Q         :'<,'> :normal @q<CR>
" Y should behave like D and C, from cursor till end of line.
noremap Y          y$
" Center search and spelling matches when navigating.
noremap n          nzz
noremap N          Nzz
noremap ]s         ]szz
noremap [s         [szz
" Confirm quit.
noremap <silent> <C-q>      :confirm qall<CR>
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
nnoremap <silent> <leader>bs :botright new<CR><C-w>=
nnoremap <silent> <leader>bt :botright new<CR><C-w>=:terminal<CR>
nnoremap <silent> <leader>bv :botright vnew<CR><C-w>=
nnoremap <silent> <leader>q  :close<CR>
nnoremap <silent> <leader>t  :$tabnew<CR>
nnoremap <silent> <C-g>s     :split<CR>
nnoremap <silent> <C-g>-     :new<CR>
nnoremap <silent> <C-g>v     :vsplit<CR>
nnoremap <silent> <C-g>\|    :vnew<CR>
nnoremap <silent> <C-g>bs    :botright new<CR><C-w>=
nnoremap <silent> <C-g>bt    :botright new<CR><C-w>=:terminal<CR>
nnoremap <silent> <C-g>bv    :botright vnew<CR><C-w>=
nnoremap <silent> <C-g>q     :close<CR>
nnoremap <silent> <C-g>t     :$tabnew<CR>
inoremap <silent> <C-g>s     <Esc>:split<CR>
inoremap <silent> <C-g>-     <Esc>:new<CR>
inoremap <silent> <C-g>v     <Esc>:vsplit<CR>
inoremap <silent> <C-g>\|    <Esc>:vnew<CR>
inoremap <silent> <C-g>bs    <Esc>:botright new<CR><C-w>=
inoremap <silent> <C-g>bt    <Esc>:botright new<CR><C-w>=:terminal<CR>
inoremap <silent> <C-g>bv    <Esc>:botright vnew<CR><C-w>=
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
    tnoremap <silent> <C-g>bs <C-\><C-N>:botright new<CR><C-w>=
    tnoremap <silent> <C-g>bt <C-\><C-N>:botright new<CR><C-w>=<C-\><C-N>:terminal<CR>
    tnoremap <silent> <C-g>bv <C-\><C-N>:botright vnew<CR><C-w>=
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
"<F1> - unused
noremap <F2>            :w<CR>
noremap <localleader>2  :w<CR>
noremap <F3>            :%retab<CR> :%s/\s\+$//<CR>
noremap <localleader>3  :%retab<CR> :%s/\s\+$//<CR>
"<F4> - unused
nnoremap <F5>           :call Spelling()<CR>
nnoremap <localleader>5 :call Spelling()<CR>
nnoremap <F6>           :source $MYVIMRC<CR>
nnoremap <localleader>6 :source $MYVIMRC<CR>
nnoremap <F7>           :set lazyredraw!<CR>:call AutoSaveToggle()<CR>
nnoremap <localleader>7 :set lazyredraw!<CR>:call AutoSaveToggle()<CR>
"<F8> - unused
"<F9> - unused
nnoremap <localleader>9 :set hlsearch!<CR>
"<F10> - unused
nnoremap <localleader>0 :call Listing()<CR>
nnoremap <F11>          :set hlsearch!<CR>
nnoremap <F12>          :call Listing()<CR>

"-----------------------------
" Misc mappings
"-----------------------------
noremap  <leader>Q       gqip
nnoremap <leader><Space> za
nnoremap <localleader>s  :syntax sync fromstart<CR>
" Copy/cut/paste/register related helper mappings.
noremap  <leader>y       :let @o=getreg("*")<CR>:let @0=getreg("*")<CR>
noremap  <leader>p       "0p
noremap  <leader>P       "0P
noremap  <leader>o       "op
noremap  <leader>O       "oP
noremap  <leader>d       "_d
" Remap refresh from Ctrl-l, now taken by split navigation, to Alt-l.
if has("gui_running") || has("nvim")
    nnoremap <A-l>       :redraw!<CR>
else
    nnoremap l         :redraw!<CR>
endif
" Nicer completion mappings when in insert mode.
"  ] - complete from tags file
"  d - dictionary completion
"  l - complete line
inoremap <C-]>           <C-x><C-]>
inoremap <C-d>           <C-x><C-k>
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
" Color schemes
"-----------------------------
Plug 'bluz71/vim-moonfly-colors'
    let g:moonflyCursorColor = 1
Plug 'bluz71/vim-moonfly-statusline'
    let g:moonflyWithGitBranchCharacter = 1
Plug 'rakr/vim-one'

"-----------------------------
" Niceties
"-----------------------------
Plug 'nelstrom/vim-visual-star-search'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'rstacruz/vim-closer'
Plug 'ervandew/supertab'
    let g:SuperTabDefaultCompletionType        = "context"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"
Plug '907th/vim-auto-save'
    let g:auto_save        = 1
    let g:auto_save_silent = 1
    let g:auto_save_events = ["InsertLeave", "TextChanged", "FocusLost"]
Plug 'Yggdroot/indentLine'
    let g:indentLine_char       = "┊"
    let g:indentLine_faster     = 1
    let g:indentLine_setColors  = 0
    let g:indentLine_setConceal = 0
Plug 'rhysd/clever-f.vim'
    let g:clever_f_across_no_line    = 1
    let g:clever_f_timeout_ms        = 3000
    let g:clever_f_mark_cursor_color = "IncSearch"
Plug 'gcmt/taboo.vim'
    let g:taboo_tab_format = " tab:%N%m "
Plug 'tommcdo/vim-lion'
    let g:lion_squeeze_spaces = 1
Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger       = "<C-j>"
    let g:UltiSnipsJumpForwardTrigger  = "<C-j>"
    let g:UltiSnipsJumpBackwardTrigger = "<C-k>"

"-----------------------------
" File management plugins
"-----------------------------
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --no-bash' }
Plug 'junegunn/fzf.vim'
    let g:fzf_layout = { "window": "silent botright 16split enew" }
    let g:fzf_commits_log_options = '--graph --color=always
      \ --format="%C(yellow)%h%C(red)%d%C(reset)
      \ - %C(bold green)(%ar)%C(reset) %s %C(blue){%an}%C(reset)"'
    nnoremap <silent> <localleader><Space> :Files<CR>
    nnoremap <silent> <localleader>-       :Files <C-r>=expand("%:h")<CR>/<CR>
    nnoremap <silent> <localleader>]       :Tags<CR>
    nnoremap <silent> <localleader>'       :Marks<CR>
    nnoremap <silent> <localleader>,       :Buffers<CR>
    nnoremap <silent> <localleader>c       :Commits<CR>
    nnoremap <silent> <localleader>h       :Helptags<CR>
    nnoremap <silent> <localleader>b]      :BTags<CR>
    nnoremap <silent> <localleader>bc      :BCommits<CR>
    nnoremap <localleader>gr               :Rg<Space>
    " ~/dotfiles/vim/after/plugin/fzf.vim - customizations
Plug 'pbogut/fzf-mru.vim'
    nnoremap <silent> <localleader>m             :FZFMru<CR>
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    " Replace arrows with text characters; not all terminal and font
    " combinations provide arrows.
    let g:NERDTreeDirArrowExpandable  = "+"
    let g:NERDTreeDirArrowCollapsible = "⠶"
    let NERDTreeHijackNetrw           = 0
    let NERDTreeStatusline            = " NERDTree "
    noremap <silent> <leader>n :NERDTreeToggle<CR> <C-w>=
    noremap <silent> <leader>f :NERDTreeFind<CR> <C-w>=
    autocmd! BufEnter * call NERDTreeRefresh()
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
    let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "±",
                \ "Staged"    : "⇆",
                \ "Dirty"     : "*",
                \ "Untracked" : "?",
                \ "Renamed"   : "≫"
                \ }
    let g:NERDTreeUpdateOnCursorHold = 0
    let g:NERDTreeUpdateOnWrite      = 0
Plug 'jlanzarotta/bufexplorer'
    let g:bufExplorerDisableDefaultKeyMapping = 1
    let g:bufExplorerFindActive               = 0
    let g:bufExplorerShowRelativePath         = 1
    let g:bufExplorerSortBy                   = "name"
    noremap <leader>l :BufExplorer<CR>
Plug 'mhinz/vim-grepper'
    let g:grepper       = {}
    let g:grepper.tools = ["rg"]
    runtime autoload/grepper.vim
    let g:grepper.jump  = 1
    let g:grepper.stop  = 500
    xmap gr <plug>(GrepperOperator)
    noremap <leader>gr :GrepperRg<Space>
    noremap <leader>*  :GrepperRg<Space>"\b<cword>\b"<CR>
    " ~/dotfiles/vim/after/plugin/grepper.vim - customization

"-----------------------------
" Development related plugins
"-----------------------------
Plug 'sheerun/vim-polyglot'
    let g:go_highlight_functions            = 1
    let g:go_highlight_function_calls       = 1
    let g:go_highlight_types                = 1
    let g:go_highlight_operators            = 1
    let g:go_highlight_build_constraints    = 1
    let g:jsx_ext_required                  = 0
    let g:polyglot_disabled                 = ["yaml"]
    let g:rubycomplete_buffer_loading       = 1
    let g:rubycomplete_classes_in_global    = 1
    let g:rubycomplete_rails                = 1
    let g:ruby_indent_access_modifier_style = "indent"
    let g:vim_json_syntax_conceal           = 0
    let g:vim_markdown_conceal              = 0
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'prettier/vim-prettier',
      \ { 'do': 'yarn install',
      \   'for': ['css', 'javascript', 'json', 'scss', 'typescript'] }
    let g:prettier#autoformat                   = 0
    let g:prettier#config#arrow_parens          = 'always'
    let g:prettier#config#bracket_spacing       = 'true'
    let g:prettier#config#jsx_bracket_same_line = 'false'
    let g:prettier#config#trailing_comma        = 'none'
    nmap <localleader>p <Plug>(Prettier)
Plug 'tpope/vim-bundler'
    " Run 'gem ctags' to generate ctags for installed gems (required just once).
Plug 'tpope/vim-rails'
    " ~/dotfiles/vim/after/plugin/rails.vim - custom mappings
Plug 'tpope/vim-projectionist'
    " ~/dotfiles/vim/after/plugin/projectionist.vim - custom projections & mappings
Plug 'neomake/neomake'
    "let g:neomake_<<language>>_enabled_makers = ["<<maker>>"]
    let g:neomake_open_list    = 1
    let g:neomake_error_sign   = {"text": "❯❯"}
    let g:neomake_warning_sign = {"text": "❯❯"}
    let g:neomake_info_sign    = {"text": "❯❯"}
    let g:neomake_message_sign = {"text": "❯❯"}
    nnoremap <silent> <localleader>l :Neomake<CR>
    nnoremap <silent> <localleader><BS> :sign unplace *<CR>:set signcolumn=auto<CR>
Plug 'janko-m/vim-test'
    nnoremap <silent> <localleader>tf :TestFile<CR>
    nnoremap <silent> <localleader>tl :TestLast<CR>
    nnoremap <silent> <localleader>ts :TestSuite<CR>
    nnoremap <silent> <localleader>tt :TestNearest<CR>
    if has("nvim")
        let test#strategy = "neovim"
    else
        let test#strategy = "vimterminal"
    endif
Plug 'chrisbra/vim-diff-enhanced'
if &diff
    " Much nicer diffs result by using the histogram algorithm.
    let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=histogram")'
endif
Plug 'tpope/vim-fugitive'
    noremap <silent> <leader>gb :Gblame<CR>
    noremap <silent> <leader>gd :Gdiff<CR>
    noremap <silent> <leader>gs :Gstatus<CR>

"-----------------------------
" tmux support
"-----------------------------
Plug 'christoomey/vim-tmux-navigator'
if &term == "screen-256color"
    " Seamless CTRL-h/j/k/l navigation between Vim splits  and tmux panes.
    " Note, only set up mappings if running inside tmux.
    let g:tmux_navigator_no_mappings = 1
    nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
    nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
    nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
    nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
endif

"-----------------------------
" Neovim specific plugins
"-----------------------------
if has("nvim")
Plug 'bfredl/nvim-miniyank'
    map p <Plug>(miniyank-autoput)
    map P <Plug>(miniyank-autoPut)
endif

"-----------------------------
" Tim Pope plugins
"-----------------------------
Plug 'tpope/vim-abolish'
    " ~/dotfiles/vim/after/plugin/abolish.vim - list of abbreviations
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-ragtag'
    " ~/dotfiles/vim/after/plugin/ragtag.vim - custom mappings
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-sleuth'
    " ~/dotfiles/vim/after/plugin/sleuth.vim - overrides
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
    autocmd FileType eelixir        setlocal matchpairs=(:),{:},[:]
    autocmd FileType eruby          setlocal formatoptions=cq matchpairs=(:),{:},[:]
    " Setup indent markers for tab-indented Go code. Note, the IndentLine
    " plugin will not show markers for tab formatted code, so we need to mimic
    " what that plugin does here using listchars and highlighting.
    autocmd FileType go             setlocal list listchars=tab:\┊\ ,trail:-
    autocmd FileType go             highlight! link SpecialKey Conceal
    " Match it navigation is broken for HTML, this Stack Overflow tip fixes it.
    autocmd FileType html           let b:match_words = "<\(\w\w*\):</\1,{:}"
    autocmd FileType java           setlocal cindent cinoptions+=j1 foldmethod=syntax
    autocmd FileType javascript.jsx setlocal formatoptions=cq
    autocmd FileType json           set conceallevel=2
    autocmd FileType markdown       setlocal formatoptions=tqln
    autocmd FileType markdown       syntax sync fromstart
    autocmd FileType ruby           setlocal formatoptions=cq
    autocmd FileType scss           let g:indentLine_faster=0
    autocmd FileType vim            setlocal formatoptions=coql
augroup END

" Custom settings per language by file extension.
"
augroup languageCustomizationsByExtension
    autocmd!
    autocmd BufEnter *.{hh,cc,icc,tcc} set filetype=cxx
    autocmd BufEnter *.html.erb        set omnifunc=htmlcomplete#CompleteTags
augroup END

" Style and behaviour customizations.
"
augroup styleAndBehaviourCustomizations
    autocmd!
    autocmd BufWinEnter    quickfix  setlocal cursorline colorcolumn=0
    autocmd FilterWritePre *         call DiffStyling()
    autocmd VimResized     *         wincmd =
    autocmd FileType       text      setlocal conceallevel=0
    if has("nvim")
        autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber
        autocmd TermOpen * startinsert
        autocmd BufEnter   term://* startinsert
        autocmd VimLeave * set guicursor=a:block
    endif
augroup END

" Plugin-related behaviours.
"
augroup pluginBehaviours
    autocmd!
    autocmd FileType    *               IndentLinesReset
    autocmd Syntax      *               IndentLinesReset
    autocmd BufWinEnter \[BufExplorer\] setlocal colorcolumn=0
    autocmd BufWinLeave \[BufExplorer\] setlocal colorcolumn=81,82
    autocmd FileType    nerdtree        IndentLinesDisable
    autocmd FileType    nerdtree
      \ setlocal colorcolumn=0 conceallevel=0 matchpairs=
    autocmd FileType css,scss
      \ let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
    autocmd FileType crystal,elixir,json
      \ let b:closer = 1 | let b:closer_flags = "([{"
    if has("nvim")
        " Escape inside a FZF terminal window should exit the terminal window
        " rather than going into the terminal's normal mode.
        autocmd FileType fzf tnoremap <buffer> <Esc> <Esc>
    endif
augroup END

" Auto-read behaviour.
"
augroup autoRead
    autocmd!
    autocmd CursorHold * silent! checktime
augroup END

"===========================================================
" COLOR SCHEME
"===========================================================

colorscheme moonfly
