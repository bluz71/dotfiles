" Useful insert mode commands:
"   Ctrl-o  for one time normal mode command (zz being most useful)
"   Ctrl-r  for insertion from a named register
"   Ctrl-b  delete backward a word
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
"   gi      move back to where you were last editing
"   mm      set a mark
"   'm      return back to 'm' mark
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
"
" Substitute in visual block:
"   '<,'>s/\%Vfoo/bar/gc
"
" Misc commands:
"   X            delete backwards
"   :r !ls *.fo  read in selected filenames
"
"   $ vim $(find **/*.txt)  edit all txt files from the current path down
"   $ vim $(ag -l foo)      edit all files that contain foo

" We want syntax highlighting on.
"
syntax on


" General vim settings.
"
set autowrite
set background=dark
set backspace=indent,eol,start
set breakindent
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set colorcolumn=81,82
set complete=.,w,b
set conceallevel=2
set expandtab
set formatoptions=cq
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set list
set listchars=tab:\ \ ,trail:-
set matchpairs=(:),{:},[:]
set mousehide
set nobackup
set nocompatible
set nohlsearch
set noshowcmd
set noshowmatch
set noshowmode
set noswapfile
set nowrapscan
set path=**
set ruler
set shiftwidth=4
set shortmess+=I
set showbreak=\\\\\
set smartcase
set smarttab
set splitbelow
set synmaxcol=200
set t_Co=256
set tabstop=4
set textwidth=79
set timeoutlen=2500
" Don't set ttimeoutlen to zero otherwise it will break terminal cursor block
" to I-beam and back functionality set by the t_SI and t_EI variables below.
set ttimeoutlen=10
set ttyfast
set ttymouse=xterm2
set updatetime=1000
set viminfo=
" Disable beeps and flashes.
set visualbell t_vb=
set wrap


" Some options should not be set in 'vi' or old versions of Vim.
"
if v:progname != "vi"
    set autoindent
    set completeopt-=preview
    set foldlevelstart=20
    set foldmethod=indent
    set foldtext=""
    set history=200
    set mouse=a
    set number
    set pumheight=35
    set cryptmethod=blowfish2
    set relativenumber
endif


" Set default value for the global variables.
"
let g:normalMode = 1
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

" Toggle special characters list display. By default we only wish to see
" leading whitespaces as dots whilst other times we want to clearly display
" tabs, spaces and end-of-lines.
"
function! Listing()
    if g:listMode == 1
        set listchars=eol:$,tab:>-,trail:.
        highlight SpecialKey ctermfg=12 guifg=#78c2ff
        let g:listMode = 0
    elseif &filetype == "go"
        set listchars=tab:\¦\
        highlight SpecialKey ctermfg=235 guifg=#262626
        let g:listMode = 1
    else
        set listchars=tab:\ \ ,trail:-
        highlight SpecialKey ctermfg=235 guifg=#262626
        let g:listMode = 1
    endif
endfunction

" Toggle macro mode. For maximum performance, when invoking a macro, it is
" best to disable file auto-saving.
"
function! MacroMode()
    let l:autosave = 1
    if exists('#autoSave#TextChanged')
        autocmd! autoSave TextChanged,InsertLeave,FocusLost *
        let l:autosave = 0
    else
        autocmd autoSave TextChanged,InsertLeave,FocusLost * silent! wall
    endif
    if l:autosave == 1
        echo "Enabled auto-save"
    else
        echo "Disabled auto-save"
    endif
endfunction

" Set the local status line depending on the specified mode.
"
function! StatusLine(mode)
    if &buftype != "" || bufname("%") == "[BufExplorer]"
        " Don't set a custom status line for special buffers such as quickfix,
        " help and the file explorer.
        return
    elseif a:mode == "not-current"
        " This is the status line for inactive windows.
        setlocal statusline=\ %*%<%f\ %h%m%r
        if exists("g:loaded_fugitive")
            " Display Git branch if fugitive is loaded.
            setlocal statusline+=\ %{fugitive#statusline()}\ 
        endif
        setlocal statusline+=%*%=%-14.(%l,%c%V%)[%L]\ %P
        return
    " All cases from here on relate to the status line of the active window.
    elseif a:mode == "normal"
        setlocal statusline=%1*\ normal\ 
    elseif a:mode == "insert"
        setlocal statusline=%2*\ insert\ 
    elseif a:mode == "visual"
        setlocal statusline=%3*\ visual\ 
    elseif a:mode == "replace"
        setlocal statusline=%4*\ overw'\ 
    endif

    setlocal statusline+=%*\ %<%f\ %h%m%r
    if exists("g:loaded_fugitive")
        " Display Git branch if fugitive is loaded.
        setlocal statusline+=%5*\ %{fugitive#statusline()}\ 
    endif
    setlocal statusline+=%6*%=%-14.(%l,%c%V%)
    setlocal statusline+=%7*[%L]\ 
    setlocal statusline+=%8*%P
endfunction

" Upon entering the NERDtree window do a root directoy refresh to automatically
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

" A windows focus event has been triggered.
"
function! WindowFocus(mode)
    if a:mode == "Enter"
        call StatusLine("normal")
    elseif a:mode == "Leave"
        call StatusLine("not-current")
    endif
endfunction

" Update the status and cursor lines if the current window is now in insert
" mode.
"
function! InsertMode(mode)
    if a:mode == "i"
        call StatusLine("insert")
    elseif a:mode == "r"
        call StatusLine("replace")
    else
        return
    endif
endfunction

" Update the status line if entering or leaving visual mode.
"
function! VisualMode()
    if mode()=~#"^[vV\<C-v>]"
        call StatusLine("visual")
        let g:normalMode = 0
    elseif g:normalMode == 0
        call StatusLine("normal")
        let g:normalMode = 1
    endif
endfunction


" Terminal specific tweaks.
"
if !has("gui_running")
    " if tmux
    if &term == 'screen-256color'
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
        " Make CTRL-Left/Right work inside tmux.
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
    " else not tmux
    else
        " Change the cursor to an I-beam when in insert mode.
        let &t_SI = "\e[6 q"
        let &t_EI = "\e[2 q"
    endif
endif


" Keyboard mappings.
"
inoremap `` <Esc>
noremap  `` <Esc>
noremap ; :
let mapleader = ","
" Simpler keyboard navigation between splits.
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Remap refresh from Ctrl-l, now taken by above split navigation, to Alt-l.
if has("gui_running")
    noremap <A-l> :redraw!<CR>
else
    " Tip: In insert mode use <C-v><Key-Combination> to view terminal characters.
    noremap l :redraw!<CR>
endif
" Delete previous word, when in insert mode, via Ctrl-b.
inoremap <C-b> <C-O>diw
" Y should behave like D and C, from cursor till end of line.
noremap Y y$
" Move vertically by visual line.
noremap j gj
noremap k gk
" Nicer completion mappings when in insert mode.
" ] - complete from tags file
" l - complete line
inoremap <C-]> <C-x><C-]>
inoremap <C-l> <C-x><C-l>
" Navigate between multiple opened files.
noremap <C-Right> :n<CR>
noremap <C-Left> :N<CR>
noremap <C-q> :confirm qall<CR>
noremap <F1> :set relativenumber!<CR>
noremap <F2> :w<CR>
noremap <F3> :%retab<CR> :%s/\s\+$//<CR>
" 'qq' starts a macro recording, 'q' stops it, <F4> runs the macro.
noremap <F4> @q
noremap <F5> :call Spelling()<CR>
noremap <F6> :source $MYVIMRC<CR>
"noremap <F7>
noremap <F8> :set paste<CR>o<C-r>*<Esc>:set nopaste<CR>
inoremap <F8> <C-o>:set paste<CR><C-o>o<C-r>*<C-o>:set nopaste<CR>
noremap <F9> :call MacroMode()<CR>
"noremap <F10>
noremap <F11> :set hlsearch!<CR>
noremap <F12> :call Listing()<CR>
" Quickfix related mappings.
noremap <leader>m :silent make<CR> :redraw!<CR>
noremap <leader>co :copen<CR>
noremap <leader>cc :cclose<CR>
noremap <leader><Up> :cp<CR>
noremap <leader><Down> :cn<CR>
" Splitting and closing.
noremap <leader>s :split<CR>
noremap <leader>v :vsplit<CR>
noremap <leader>q :close<CR>
" Tabbing.
noremap tn :tabnew<CR>
noremap tc :tabclose<CR>
noremap t1 1gt
noremap t2 2gt
noremap t3 3gt
noremap t4 4gt
noremap t5 5gt
noremap t6 6gt
" Folding.
nnoremap <leader><Space> za
" Equalize split sizes.
noremap <leader>= <C-w>=
" 'y' register copy and paste mappings.
noremap <leader>y :let @y=getreg('*')<CR>
noremap <leader>p "yp
noremap <leader>P "yP
" Regenerate tags file.
noremap <leader>tt :!ctags -R --exclude=.git --exclude=log .<CR>
" Skeletons/Templates support.
if has('win32') || has ('win64')
    let $VIMHOME = $VIM."/vimfiles"
else
    let $VIMHOME = $HOME."/.vim"
endif
nnoremap <leader>khtml :read $VIMHOME/skeletons/skeleton.html<CR>
nnoremap <leader>kscript :read $VIMHOME/skeletons/skeleton.script<CR>


" Plugins via Vundle.
"
" Note, on Unix Vundle is installed via:
"
"   % git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"
" On Windows please make sure msysgit is installed AND git/curl are available
" in the PATH. Vundle is then installed via:
"
"   C:\> cd %USERPROFILE%
"   C:\> git clone https://github.com/gmarik/Vundle.vim.git vimfiles/bundle/Vundle.vim
"
" Plugins are installed in Vim via:
"
"   :PluginInstall
"
" Plugins are updated in Vim via:
"
"   :PluginInstall!
"
if has("unix") && system("uname") == "Linux\n" || system("uname") == "Darwin\n" && v:progname != "vi"
    " Initialize Vundle.
    filetype off
    set runtimepath+=~/.vim/bundle/Vundle.vim
    call vundle#begin()

    Plugin 'gmarik/Vundle.vim'
    Plugin 'stefandtw/quickfix-reflector.vim'

    Plugin 'ctrlpvim/ctrlp.vim'
    " Use ag in CtrlP for listing files, very fast and respects .gitignore.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Using ag is fast, we don't need to cache.
    let g:ctrlp_use_caching = 0
    " The match should be at the top of the list.
    let g:ctrlp_match_window_reversed = 0
    " Use CtrlP to search by tag.
    nnoremap <leader>. :CtrlPTag<CR>

    Plugin 'rking/ag.vim'
    let g:ag_mapping_message = 0
    let g:ag_highlight = 1
    noremap <leader>a :Ag<Space>
    " Note, use '-G extension$ <searchterm>' to restrict an Ag search to a
    " particular file extension.

    Plugin 'tpope/vim-fugitive'
    " Git shortcuts.
    noremap <leader>gb :Gblame<CR>
    " Hit <enter> on a file line, in the status window, to open.
    " Hit '-' to 'git add' the file on the current line.
    noremap <leader>gs :Gstatus<CR>

    " Seamless CTRL-h/j/k/l navigation between Vim splits  and tmux panes.
    " Note, only set up mappings if running inside tmux.
    Plugin 'christoomey/vim-tmux-navigator'
    if &term == 'screen-256color'
        let g:tmux_navigator_no_mappings = 1
        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
    endif

    " Ruby support, including code completion, ctags for gems and automatic
    " end insertion.
    " 
    " Run 'gem ctags' to generate ctags for installed gems (only required once only).
    Plugin 'vim-ruby/vim-ruby'
    Plugin 'tpope/vim-bundler'
    let g:rubycomplete_buffer_loading = 1
    let g:rubycomplete_classes_in_global = 1
    let g:rubycomplete_rails = 1
    let g:ruby_indent_access_modifier_style = 'indent'

    " Ruby on Rails support.
    "
    " Use 'gf' mapping to navigate objects inside a Rails project, use CTRL-O
    " and CTRL-I to navigate backward and forward.
    "
    " Use a visual selection in conjunction with ':Rextract <<partial-name>>'
    " to move a block of code from a view to a new partial.
    Plugin 'tpope/vim-rails'
    noremap <leader>em :Emodel<Space>
    noremap <leader>ev :Eview<Space>
    noremap <leader>ec :Econtroller<Space>
    noremap <leader>eh :Ehelper<Space>

    " Rspec support.
    Plugin 'thoughtbot/vim-rspec'
    noremap <leader>rs :call RunNearestSpec()<CR>
    noremap <leader>rt :call RunCurrentSpecFile()<CR>
    noremap <leader>rl :call RunLastSpec()<CR>
    noremap <leader>ra :call RunAllSpecs()<CR>

    " JavaScript and CoffeeScript support.
    Plugin 'pangloss/vim-javascript'
    Plugin 'kchmck/vim-coffee-script'
    Plugin 'mxw/vim-jsx'
    let g:jsx_ext_required = 0

    " Elixir support
    Plugin 'elixir-lang/vim-elixir'
elseif has("win32") || has("win32unix") && v:progname != "vi"
    " Initialize Vundle.
    filetype off
    set runtimepath+=~/vimfiles/bundle/Vundle.vim
    let path='~/vimfiles/bundle'
    call vundle#begin(path)

    Plugin 'gmarik/Vundle.vim'

    Plugin 'kien/ctrlp.vim'
    " CtrlP, the match should be at the top of the list.
    let g:ctrlp_match_window_reversed = 0
    " Note, use F5 to refresh CtrlP cache.
endif

" Platform independent plugins and customizations.
"
if exists("g:vundle#bundles")
    Plugin 'nelstrom/vim-visual-star-search'
    Plugin 'tpope/vim-endwise'
    Plugin 'tpope/vim-commentary'

    Plugin 'tpope/vim-surround'
    " Normal mode
    " -----------
    " ds<surround>  - delete a surround
    " cs<old><new>  - change a surround
    " 
    " Visual mode
    " -----------
    " S - add a surround
    " 
    " Insert mode
    " -----------
    " <CTRL-s>         - add a surround
    " <CTRL-s><CTRL-s> - add a new line + surround + indent

    Plugin 'jlanzarotta/bufexplorer'
    let g:bufExplorerFindActive = 0
    let g:bufExplorerShowRelativePath = 1
    let g:bufExplorerSortBy = 'name'
    noremap <leader>l :BufExplorer<CR>

    Plugin 'Yggdroot/indentLine'
    let g:indentLine_char = '¦'
    let g:indentLine_color_term = 235
    let g:indentLine_color_gui = "#262626"
    let g:indentLine_faster = 1
    let g:indentLine_setConceal = 0

    Plugin 'scrooloose/nerdtree'
    " Show line numbers and make the NERDTree window a little wider.
    let NERDTreeShowLineNumbers = 1
    let NERDTreeWinSize = 35
    " Replace arrows with text characters; not all terminal and font
    " combinations provide arrows.
    let g:NERDTreeDirArrowExpandable = "+"
    let g:NERDTreeDirArrowCollapsible = "~"
    let NERDTreeStatusline = " NERDTree "
    noremap <leader>n :NERDTreeToggle<CR>

    Plugin 'Xuyuanp/nerdtree-git-plugin'
    let g:NERDTreeIndicatorMapCustom = {
                \ "Modified"  : "!",
                \ "Staged"    : "=",
                \ "Dirty"     : "*",
                \ "Untracked" : "?",
                \ "Renamed"   : ">",
                \ "Clean"     : "$"
                \ }
    let g:NERDTreeUpdateOnCursorHold = 0

    Plugin 'ervandew/supertab'
    " Play nice with other plugins and force top-to-bottom tab completion.
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"

    Plugin 'rhysd/clever-f.vim'
    let g:clever_f_across_no_line = 1

    Plugin 'gcmt/taboo.vim'
    let g:taboo_tab_format = " tab:%N%m "

    " Finalize Vundle.
    call vundle#end()
    filetype plugin indent on
endif


" Load up the match it plugin which provides smart % XML/HTML matching.
runtime macros/matchit.vim


" Custom settings per language by file type.
"
augroup languageCustomizationsByType
    " Note, 'autocmd!' is used to clear out any existing definitions in
    " this auto-group. This prevents duplicate entries upon a live vimrc
    " reload.
    autocmd!
    autocmd FileType c,cpp set cindent foldmethod=syntax
    autocmd FileType coffee set shiftwidth=2
    autocmd FileType css set shiftwidth=2
    autocmd FileType eelixir set matchpairs=(:),{:},[:]
    autocmd FileType eruby set formatoptions=cq shiftwidth=2 matchpairs=(:),{:},[:]
    " Setup indent lines for tab formatted Golang code. Note, the IndentLine 
    " plugin will not show markers for tab formatted code, so we need to mimic
    " what that plugin does here using listchars and highlighting.
    autocmd FileType go set listchars=tab:\│\ 
    autocmd FileType go highlight SpecialKey ctermfg=234 guifg=#1c1c1c
    " Match it navigation is broken for HTML, this Stack Overflow tip fixes it.
    autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
    autocmd FileType html set shiftwidth=2 textwidth=999
    autocmd FileType java set cindent cinoptions+=j1 foldmethod=syntax
    " Setup ESLint when making JavaScript files.
    autocmd FileType javascript set shiftwidth=2 errorformat=%f:\ line\ %l\\,\ col\ %c\\,\ %m makeprg=eslint\ -f\ compact\ --quiet\ %
    autocmd FileType javascript.jsx set formatoptions=cq
    autocmd FileType ruby set formatoptions=cq shiftwidth=2 makeprg=ruby\ -w\ %
    autocmd FileType scss let g:indentLine_faster=0
    autocmd FileType scss set shiftwidth=2
    autocmd FileType sh set textwidth=999
    autocmd FileType vim set textwidth=999
    autocmd FileType xml set shiftwidth=2 textwidth=999
    autocmd FileType yaml set shiftwidth=2 textwidth=999
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
    autocmd VimEnter,WinEnter,BufWinEnter,InsertLeave * call WindowFocus("Enter")
    autocmd WinLeave,FilterWritePost * call WindowFocus("Leave")
    autocmd InsertEnter * call InsertMode(v:insertmode)
    autocmd CursorMoved,CursorHold * call VisualMode()
    autocmd BufEnter * call NERDTreeRefresh()
    autocmd BufWinEnter quickfix setlocal cursorline colorcolumn=0
    autocmd FileType help,nerdtree,text setlocal conceallevel=0 colorcolumn=0
    autocmd FileType json,markdown setlocal conceallevel=0
    autocmd FilterWritePre * call DiffStyling()
    autocmd QuickFixCmdPost *make* cwindow
    if v:progname != "vi"
        autocmd FileType * IndentLinesReset
        autocmd Syntax * IndentLinesReset
    endif
augroup END

" Autosave behaviour.
"
augroup autoSave
    autocmd!
    autocmd TextChanged,InsertLeave,FocusLost * silent! wall
augroup END

" Set the color scheme
"
colorscheme moonfly
