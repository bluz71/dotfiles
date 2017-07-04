" TIPS & TRICKS
"
" Useful insert mode commands:
"   Ctrl-o       for one time normal mode command (zz being most useful)
"   Ctrl-r<reg>  for insertion from a named register
"   Ctrl-b       delete backward a word
"   Ctrl-r=      expression register (eg 43 + 44 --> 87)
"
" Useful cursor positioning and movement commands:
"   zt      move text under cursor to the top
"   zz      move text under cursor to the center
"   zb      move text under cursor to the bottom
"   zl      move text under cursor one character to the left
"   zL      move text under cursor half a screen to the left
"   H       move to top of screen
"   M       move to middle of screen
"   L       move to end of screen
"   g;      move back to where you were last editing
"   mm      set a mark in the current file
"   'm      return back to 'm' mark in the current file
"   mM      set a global mark
"   'M      return back to the global 'M' mark
"   {/}     move between paragraphs
"   (/)     move between sentences
"   ge/gE   move to the end of the previous word/WORD
"   Ctrl-e  scroll file up one line at a time
"   Ctrl-y  scroll file down one line at a time
"
" Completion sub-types when in insert completion-mode initiated via Ctrl-x:
"   Ctrl-f  file name completion based on files in the CWD
"   Ctrl-k  dictionary completion
"   Ctrl-l  line completion
"   Ctrl-o  omni completion
"   Ctrl-]  tag completion
"
" Spelling commands:
"   z=      Suggest spelling correction
"   ]s      Move to next spelling error
"   [s      Move to previous spelling error
"   zg      Add current word to dictionary
"   zw      Delete current word from dictionary
"
" Tag navigation:
"   Ctrl-]  find definition under cursor
"   Ctrl-o  return back from definition
"
" Visual mode commands:
"   gv           repeat last visual selection
"   u/U          change visual selection to lower or upper case
"   vip/vap      visual select paragraph
"   vis/vas      visual select sentence
"   vit/vat      visual select tag
"   :'<,'>!sort  sort visual selection
"   :'<,'>!uniq  uniq visual selection
"   gx           open link in a browser
"
" Substitute in visual block:
"   '<,'>s/\%Vfoo/bar/c
"
" Misc commands:
"   X                  delete backwards
"   gf                 go to file under cursor
"   gq                 format text
"   :r !ls *.txt       read in selected filenames
"   /<term>            search forward for 'term'
"   ?<term>            search backward for 'term'
"   :%s//<new>         replace last search 'term' with 'new'
"   :%s//<new>/c       replace, with confirmation, last search 'term' with 'new'
"   :%s///n            list match count for the last search
"   :g/<pattern>       list all lines containing 'pattern'
"   :g/<pattern>/d     delete all lines containing 'pattern'
"   :v/<pattern>       list all lines NOT containing 'pattern'
"   :v/<pattern>/d     delete all lines NOT containing 'pattern'
"   :g/<pattern/normal @q execute macro 'q' over all lines that match pattern
"
"   /<term>            search for 'term'
"   cgn                replace last search match
"   dgn                delete last search match
"   .                  repeat last change
"
"   % vim $(find **/*.txt)  edit all txt files from the current path down
"   % vim $(ag -l foo)      edit all files that contain foo
"
"   % cat do.vim
"   :%s/term/new/g
"   :wq
"   % vim -es file.txt < do.vim  'sed' style scripted edits
"
"   :h digraph-table             list all displayable characters
"
"   :syntime on      start syntax performance monitoring
"   :syntime report  display sorted list of expensive syntax patterns
"
"   :term            start nvim terminal
"
" Plugin details:
"
"   vim-abolish:
"     :S/<pattern>                     - smartly search for pattern 
"
"     :%S/facilit{y,ies}/building{,s}/ - change all facilities to buildings
"     :%S/old_name/new_description/    - old_name --> new_description
"                                        OldName  --> NewDescription
"     :%S/h{2,3}/h{3,2}/               - change all h2 to h3
"
"     crs - change to snake_case
"     crc - change to camelCase
"     crm - change to MixCase
"
"   vim-bundler:
"     Run 'gem ctags' to generate ctags for installed gems (required just once).
"
"   vim-commentary:
"     gc                 - comment out a visual block
"
"   vim-grepper.vim:
"     '-G extension$ <searchterm>' to restrict ag to a particular file extension
"     '-t<type> <searchterm>' to restrict rg to a particular file type
"
"   vim-rails:
"     Use a visual selection in conjunction with ':Rextract <<partial-name>>'
"     to move a block of code from a view to a new partial.
"
"   vim-surround:
"     Normal mode:
"       ds<surround>     - delete a surround
"       cs<old><new>     - change a surround
"
"     Visual mode:
"       S                - add a surround
"
"     Insert mode:
"       <CTRL-s>         - add a surround
"       <CTRL-s><CTRL-s> - add a new line + surround + indent


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
set nosplitright      " No to splitting a window to the right
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
set synmaxcol=200     " Only syntax highlight for 200 chars (for performance)
set t_Co=256          " 256 color support
set tabstop=4
set textwidth=79
set timeoutlen=2500   " Give some time for multi-key mappings
" Don't set ttimeoutlen to zero otherwise it will break terminal cursor block
" to I-beam and back functionality set by the t_SI and t_EI variables below.
set ttimeoutlen=10
set ttyfast
set updatetime=1000
set viminfo=          " No backups
set wildignore+=.git/**,_build/**,build/**,cache/**,node_modules/**,lib/**,log/**,tmp/**
set wildmenu
set wildmode=full
set wrap              " Wrap long lines

" Certain options only work in Neovim whilst others only work in Vim.
" Neovim has a Whitespace highlight group, Vim does not.
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
nnoremap <silent> <leader>s :split<CR>
nnoremap <silent> <leader>v :vsplit<CR>
nnoremap <silent> <leader>q :close<CR>
nnoremap <silent> <leader>t :$tabnew<CR>
nnoremap <leader>1          1gt
nnoremap <leader>2          2gt
nnoremap <leader>3          3gt
nnoremap <leader>4          4gt
nnoremap <leader>5          5gt
nnoremap <leader>=          <C-w>=
nnoremap <leader>R          <C-w>r
" Zoom the current file into a standalone new tab.
nnoremap <silent> <leader>z :tab split<CR>

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
nnoremap <silent> <localleader>s :syntax sync fromstart<CR>
" Yank and put helpers.
noremap <leader>y        :let @0=getreg('*')<CR>
noremap <leader>p        "0]p
noremap <leader>P        "0]P
" Regenerate tags file.
nnoremap <localleader>tc :call system("ctags -R")<CR>
nnoremap <localleader>tr :call system("ripper-tags -R")<CR>
" Remap refresh from Ctrl-l, now taken by split navigation, to Alt-l.
if has("gui_running") || has("nvim")
    nnoremap <A-l>       :redraw!<CR>
else
    nnoremap l         :redraw!<CR>
endif
" Nicer completion mappings when in insert mode.
" ] - complete from tags file
" l - complete line
inoremap <C-]>           <C-x><C-]>
inoremap <C-l>           <C-x><C-l>
" Replace search term under cursor, dot repeats the change.
nnoremap c* *Ncgn
nnoremap c# #NcgN
" ~/.inputrc like motions in command mode.
cnoremap <C-a>           <Home>
cnoremap <C-e>           <End>
cnoremap <A-b>           <C-Left>
cnoremap <A-f>           <C-Right>
" Skeleton/snippet support.
if has('win32') || has ('win64')
    let $VIMHOME = $HOME . "/vimfiles"
else
    let $VIMHOME = $HOME . "/.vim"
endif
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
    let g:moonflySpellReversed = 1
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
    let g:clever_f_across_no_line = 1
    let g:clever_f_timeout_ms     = 3000
Plug 'gcmt/taboo.vim'
    let g:taboo_tab_format = " tab:%N%m "
Plug 'tommcdo/vim-lion'
    let g:lion_squeeze_spaces = 1

"-----------------------------
" File management plugins
"-----------------------------
Plug 'ctrlpvim/ctrlp.vim'
    " Use rg in CtrlP for listing files, very fast and respects .gitignore.
    let g:ctrlp_user_command          = 'rg %s --files --color=never --glob ""'
    " Using rg is fast, we don't need to cache.
    let g:ctrlp_use_caching           = 0
    " The match should be at the top of the list.
    let g:ctrlp_match_window_reversed = 0
    " Don't jump to a different tab.
    let g:ctrlp_switch_buffer         = 'e'
    nnoremap <localleader>.           :CtrlPTag<CR>
    nnoremap <localleader>/           :CtrlPBuffer<CR>
    " Mappings to navigate model/view/controllers for certain web frameworks.
    if filereadable('config/environment.rb') && isdirectory('app')
        " This looks like a Rails app.
        noremap <localleader>ec :CtrlP app/controllers<CR>
        noremap <localleader>eh :CtrlP app/helpers<CR>
        noremap <localleader>em :CtrlP app/models<CR>
        noremap <localleader>es :CtrlP spec<CR>
        noremap <localleader>eT :CtrlP test<CR>
        noremap <localleader>ev :CtrlP app/views<CR>
    elseif filereadable('web/router.ex')
        " This looks like an Elixir/Phoenix app.
        noremap <localleader>ec :CtrlP web/controllers<CR>
        noremap <localleader>em :CtrlP web/models<CR>
        noremap <localleader>eT :CtrlP test<CR>
        noremap <localleader>et :CtrlP web/templates<CR>
        noremap <localleader>ev :CtrlP web/views<CR>
    endif
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
    noremap <leader>ga :GrepperAg<Space>
    noremap <leader>gr :GrepperRg<Space>

"-----------------------------
" Language/framework plugins
"-----------------------------
Plug 'sheerun/vim-polyglot'
    let g:go_highlight_functions            = 1
    let g:go_highlight_methods              = 1
    let g:go_highlight_structs              = 1
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
" Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
    " ~/dotfiles/vim/after/plugin/projectionist.vim - list of projections
    nnoremap <leader>ec :Econtroller<Space>
    nnoremap <leader>eh :Ehelper<Space>
    nnoremap <leader>el :Echannel<Space>
    nnoremap <leader>em :Emodel<Space>
    nnoremap <leader>es :Espec<Space>
    nnoremap <leader>et :Etemplate<Space>
    nnoremap <leader>eT :Etest<Space>
    nnoremap <leader>ev :Eview<Space>
    nnoremap <leader>A  :A<CR>
Plug 'neomake/neomake'
    "let g:neomake_<<language>>_enabled_makers = ["<<maker>>"]
    let g:neomake_open_list        = 1
    let g:neomake_error_sign       = {'text': '->'}
    let g:neomake_warning_sign     = {'text': '->'}
    let g:neomake_info_sign        = {'text': '->'}
    let g:neomake_message_sign     = {'text': '->'}
    nnoremap <silent> <leader>m    :Neomake<CR>
    nnoremap <silent> <leader><BS> :sign unplace *<CR>:set signcolumn=auto<CR>
    if !&diff
        autocmd! BufEnter *.{js,md} Neomake
    endif
Plug 'janko-m/vim-test'
    nnoremap <silent> <localleader>T  :TestNearest<CR>
    nnoremap <silent> <localleader>tf :TestFile<CR>
    nnoremap <silent> <localleader>ts :TestSuite<CR>
    nnoremap <silent> <localleader>tl :TestLast<CR>
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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'

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
    autocmd FileType c,cpp setlocal cindent foldmethod=syntax
    autocmd FileType coffee setlocal shiftwidth=2
    autocmd FileType css setlocal shiftwidth=2
    autocmd FileType css,scss let g:SuperTabDefaultCompletionType = "<c-x><c-o>"
    autocmd FileType eelixir setlocal matchpairs=(:),{:},[:]
    autocmd FileType eruby setlocal formatoptions=cq shiftwidth=2 matchpairs=(:),{:},[:]
    " Setup indent lines for tab formatted Golang code. Note, the IndentLine 
    " plugin will not show markers for tab formatted code, so we need to mimic
    " what that plugin does here using listchars and highlighting.
    autocmd FileType go setlocal list listchars=tab:\¦\ 
    autocmd FileType go highlight SpecialKey ctermfg=234 guifg=#1c1c1c
    " Match it navigation is broken for HTML, this Stack Overflow tip fixes it.
    autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
    autocmd FileType html setlocal shiftwidth=2 textwidth=999
    autocmd FileType java setlocal cindent cinoptions+=j1 foldmethod=syntax
    autocmd FileType javascript setlocal shiftwidth=2
    autocmd FileType javascript.jsx setlocal formatoptions=cq
    autocmd FileType json setlocal conceallevel=0
    autocmd FileType markdown setlocal formatoptions=tqln
    autocmd FileType markdown syntax sync fromstart
    autocmd FileType ruby setlocal formatoptions=cq shiftwidth=2 makeprg=ruby\ -w\ %
    autocmd FileType scss let g:indentLine_faster=0
    autocmd FileType scss setlocal shiftwidth=2
    autocmd FileType sh setlocal textwidth=999
    autocmd FileType vim setlocal textwidth=999
    autocmd FileType xml setlocal shiftwidth=2 textwidth=999
    autocmd FileType yaml setlocal shiftwidth=2 textwidth=999
augroup END

" Custom settings per language by file extension.
"
augroup languageCustomizationsByExtension
    autocmd!
    autocmd BufEnter *.{hh,cc,icc,tcc} set filetype=cxx
    autocmd BufEnter *.html.erb set omnifunc=htmlcomplete#CompleteTags
augroup END

" Style and behaviour customizations for certain modes and window types.
"
augroup styleAndBehaviourCustomizations
    autocmd!
    autocmd BufWinEnter quickfix setlocal cursorline colorcolumn=0
    autocmd BufWinEnter \[BufExplorer\] setlocal colorcolumn=0
    autocmd BufWinLeave \[BufExplorer\] setlocal colorcolumn=81,82
    autocmd FileType nerdtree,netrw setlocal conceallevel=0 colorcolumn=0 matchpairs=
    autocmd FilterWritePre * call DiffStyling()
    autocmd FileType * IndentLinesReset
    autocmd Syntax * IndentLinesReset
    autocmd VimResized * wincmd =
    if has("nvim")
        autocmd TermOpen * setlocal conceallevel=0 colorcolumn=0 relativenumber
        autocmd BufEnter term://* startinsert
    endif
augroup END

" Autosave and autoread behaviour.
"
augroup autoSaveAndRead
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
    autocmd CursorHold * silent! checktime
augroup END

"===========================================================
" COLOR SCHEME
"===========================================================

" set termguicolors
colorscheme moonfly
