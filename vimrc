" We want syntax highlighting on.
"
syntax on


" General vim settings.
"
set autowrite
set background=dark
set backspace=indent,eol,start
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set complete=.,w,b
set expandtab
set formatoptions=cq
set ignorecase
set incsearch
set laststatus=2
set lazyredraw
set listchars=eol:$,tab:>-,trail:-
set makeprg=tmake
set mouse=a
set mousehide
set nobackup
set nocompatible
set nohlsearch
set noshowmode
set noswapfile
set nowrap
set nowrapscan
set novisualbell
set path=.,~/projects/**
set ruler
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smarttab
set splitbelow
set t_Co=256
set tabstop=4
set textwidth=79
set ttimeoutlen=0
set ttymouse=xterm2
set viminfo=


" Some options should not be set in 'vi' or old versions of Vim.
"
if v:progname != "vi"
    set autoindent
    set completeopt-=preview
    set foldmethod=manual
    set foldtext=""
    set history=200
    set mouse=a
    set number
    set pumheight=35
    if version >= 703
        " Certain options are only available in Vim 7.3 and later.
        let &colorcolumn = join(range(81,300),",")
        set cryptmethod=blowfish
        set relativenumber
    endif
endif


" Set default value for the global variables.
"
let g:blockFolds = 0
let g:colorColumn = 1
let g:normalMode = 1

" Fold up all functions of the active buffer.
"
function! BlockFolds()
    if g:blockFolds
        set foldcolumn=0
        set foldmethod=manual
        %foldopen!
        let g:blockFolds = 0
    else
        set foldcolumn=1
        if &filetype == "cxx"
            set foldmethod=syntax
        else
            set foldmethod=indent
        endif
        %foldclose!
        if &filetype == "java" || &filetype == "cs"
            set foldlevel=1
        endif
        let g:blockFolds = 1
    endif
endfunction

" Open up a related file, with a different file extension, of the current
" active buffer file.
"
function! FileOpen(extension)
    let s:basefile = substitute(bufname("%"), "\\.[a-zA-Z]\\+$", "", "")
    let s:newfile = s:basefile . a:extension
    if bufexists(s:newfile)
        execute "buffer" s:newfile
    elseif filereadable(s:newfile)
        execute "edit" s:newfile
    else
        echo s:newfile ": no such file."
    endif
endfunction

" Toggle the color column. Highlight search colors are all screwed up with the
" color column, same with text wrapping.
"
function! ColorColumn()
    if version < 703
        " Only Vim 7.3 (and later) support the color column.
        return
    endif
    if g:colorColumn
        set colorcolumn=""
        let g:colorColumn = 0
    else
        let &colorcolumn = join(range(81,300),",")
        let g:colorColumn = 1
    endif
endfunction

" Set the local status line depending on the specified mode.
"
function! StatusLine(mode)
    if &buftype != '' || bufname("%") == "[BufExplorer]"
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
    endif

    setlocal statusline+=%*\ %<%f\ %h%m%r
    if exists("g:loaded_fugitive")
        " Display Git branch if fugitive is loaded.
        setlocal statusline+=%4*\ %{fugitive#statusline()}\ 
    endif
    setlocal statusline+=%5*%=%-14.(%l,%c%V%)
    setlocal statusline+=%6*[%L]\ 
    setlocal statusline+=%*%P
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
    if a:mode != "i"
        return
    endif
    call StatusLine("insert")
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

" Toggle the color column and indent markers when entering and leaving Vim 
" diff. In Vim diff both color column and indent markers look wrong.
"
function! DiffMode()
    if &diff
        setlocal colorcolumn=""
        setlocal conceallevel=0
    else
        if version >= 703 && &colorcolumn == ""
            let &colorcolumn = join(range(81,300),",")
        endif
        if &conceallevel == 0
            setlocal conceallevel=2
        endif
    endif
endfunction


" Keyboard mappings.
"
noremap <C-Right> ;
noremap <C-Left> ,
if &term == 'screen-256color'
    " Make CTRL-Left/Right work inside tmux.
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
endif
noremap ; :
let mapleader = ","
" Simpler keyboard navigation between splits.
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Need to remap existing Ctrl-l (refresh), use leader-c instead. 
noremap <leader>cl :redraw!<CR>
" Y should behave like D and C, from cursor till end of line.
noremap Y y$
" Move vertically by visual line.
noremap j gj
noremap k gk
" Navigate between multiple opened files.
noremap <Space><Right> :n<CR>
noremap <Space><Left> :N<CR>
noremap <C-q> :confirm qall<CR>
noremap <F1> :call ColorColumn()<CR>
noremap <leader>1 :set relativenumber!<CR>
noremap <F2> :w<CR>
noremap <F3> :%retab<CR> :%s/\s\+$//<CR>
" 'qa' starts a macro recording, 'q' stops it, <F4> runs the macro.
noremap <F4> @a
noremap <F5> :call FileOpen(".hh")<CR>
noremap <F6> :call FileOpen(".icc")<CR>
noremap <F7> :call FileOpen(".cc")<CR>
noremap <F8> :call FileOpen(".tcc")<CR>
noremap <F9> :call BlockFolds()<CR>
noremap <F11> :set hlsearch!<CR> :call ColorColumn()<CR>
noremap <F12> :set list!<CR>
" Compilation related mappings.
noremap <A-F5> :make<CR>
noremap <A-F6> :cp<CR>
noremap <A-F7> :cn<CR>
noremap <A-F8> :copen 15<CR>
" Splitting/tabbing and closing.
noremap <leader>s :split<CR>
noremap <leader>v :vsplit<CR>
noremap <leader>q :close<CR>
" Equalize split sizes.
noremap <leader>= <C-w>=
" Other leader shortcuts.
noremap <leader>el :setlocal spell!<CR>
noremap <leader>r :source $MYVIMRC<CR>
" 'x' register copy and paste mappings.
noremap <leader>x :let @x=getreg('*')<CR>
noremap <leader>p "xp
noremap <leader>P "xP
"
" Useful fold commands.
"   zf in visual mode to create a fold.
"   zd to delete a fold.
"
" Useful cursor positioning commands.
"   xt move text under cursor to the top.
"   zz move text under cursor to the center.
"   xb move text under cursor to the bottom.
"   H move to top of screen
"   M move to middle of screen
"   L move to end of screen
"
" Spelling commands.
"   z= Suggest spelling correction.
"   ]s Move to next spelling error
"   [s Move to previous spelling error
"   zg Add current word to dictionary
"   zw Delete current word from dictionary


" Plugins via Vundle.
"
" Note, on Unix Vundle is installed via:
"
"   % git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
"
" On Windows please make sure msysgit is installed AND git/curl are available
" in the PATH. Vundle is then installed via:
"
"   C:\> cd %USERPROFILE%
"   C:\> git clone https://github.com/gmarik/vundle.git vimfiles/bundle/vundle
"
" Plugins are installed in Vim via:
"
"   :BundleInstall
"
" Plugins are updated in Vim via:
"
"   :BundleInstall!
"
if has("unix") && system("uname") == "Linux\n" && v:progname != "vi"
    filetype off
    set runtimepath+=~/.vim/bundle/vundle/
    call vundle#rc()
    filetype plugin indent on

    Bundle "gmarik/vundle"
    Bundle "majutsushi/tagbar"
    Bundle "tpope/vim-fugitive"
    Bundle "stefandtw/quickfix-reflector.vim"

    Bundle "kien/ctrlp.vim"
    " Use ag in CtrlP for listing files, very fast and respects .gitignore.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Using ag is fast, we don't need to cache.
    let g:ctrlp_use_caching = 0
    " The match should be at the top of the list.
    let g:ctrlp_match_window_reversed = 0

    Bundle "mileszs/ack.vim"
    " Use ag instead of ack, ag is faster.
    let g:ackprg = 'ag --nogroup --nocolor --column'
    " Note, use '-G extension$ <searchterm>' to restrict an Ag search to a
    " particular file extension.

    Bundle "Rip-Rip/clang_complete"
    " Set this variable if clang is in a non-standard place.
    "let g:clang_library_path = "/usr/local/clang/lib/"
    " Don't autocomplete, use tab character (from supertab) to complete.
    let g:clang_complete_auto = 0

    Bundle "rhysd/vim-clang-format"
    " Set this variable if clang-format is in a non-standard place.
    "let g:clang_format#command = "/usr/local/clang/bin/clang-format"
    " Refer to http://clang.llvm.org/docs/ClangFormatStyleOptions.html
    " for full ClangFormat details.
    let g:clang_format#style_options = {
                \ "UseTab" : "Never",
                \ "ColumnLimit" : 80,
                \ "AccessModifierOffset" : -4,
                \ "BreakBeforeBraces" : "Allman",
                \ "Standard" : "Cpp11",
                \ "IndentWidth" : 4,
                \ "BreakBeforeBinaryOperators" : "true",
                \ "AlwaysBreakTemplateDeclarations" : "true",
                \ "MaxEmptyLinesToKeep" : 2}

    " Plugin mappings specific to this platform.
    noremap <leader>a :Ack<Space>
    noremap <leader>tb :TagbarToggle<CR>
    noremap <leader>cf :ClangFormat<CR>
    noremap <leader>ce :call g:ClangUpdateQuickFix()<CR>
    "
    " Useful clang navigation mappings.
    " CTRL-] find function definition.
    " CTRL-t return back from function definition.
    "
    " Git shortcuts.
    noremap <leader>gb :Gblame<CR>
    noremap <leader>gc :Gcommit<CR>
    " Please only lauch Git diff from the right-most split, otherwise the
    " matching gq mapping won't close Git diff correctly.
    noremap <leader>gd :Gvdiff<CR>
    " Like above but compare with HEAD, this diff will show staged and
    " unstaged changes.
    noremap <leader>gh :Gvdiff HEAD<CR>
    " Quit the window opened by Git diff.
    noremap <leader>gq :diffoff!<CR><C-w>h:bd<CR> :call DiffMode()<CR>
    " Hit <enter> on a file line, in the status window, to open.
    " Hit '-' to 'git add' the file on the current line.
    noremap <leader>gs :Gstatus<CR>

    " Seamless CTRL-h/j/k/l navigation between Vim splits  and tmux panes.
    " Note, only set up mappings if running inside tmux.
    Bundle "christoomey/vim-tmux-navigator"
    if &term == 'screen-256color'
        let g:tmux_navigator_no_mappings = 1
        nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
        nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
        nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
        nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
    endif
elseif has("win32") && v:progname != "vi"
    filetype off
    set runtimepath+=~/vimfiles/bundle/vundle/
    let path='~/vimfiles/bundle'
    call vundle#rc(path)
    filetype plugin indent on

    Bundle "gmarik/vundle"

    Bundle "kien/ctrlp.vim"
    " CtrlP, the match should be at the top of the list.
    let g:ctrlp_match_window_reversed = 0
    " Note, use F5 to refresh CtrlP cache.
endif

" Platform independent plugins and customizations.
if exists("g:bundles")
    Bundle "corntrace/bufexplorer"
    Bundle "nelstrom/vim-visual-star-search"

    Bundle "Yggdroot/indentLine"
    " Lighten the indent marker color.
    let g:indentLine_color_term = 236
    let g:indentLine_color_gui = "#303030"

    Bundle "scrooloose/nerdtree"
    " Show line numbers and make the NERDTree window a little wider.
    let NERDTreeShowLineNumbers = 1
    let NERDTreeWinSize = 35
    let NERDTreeDirArrows = 0
    " Note, use 'C' to change the tree root to the selected directory.

    Bundle "ervandew/supertab"
    " Play nice with clang-complete and force top-to-bottom tab completion.
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"

    " Platform independent mappings for certain plugins.
    noremap <leader>n :NERDTreeToggle<CR>
    noremap <leader>l :BufExplorer<CR>
endif


" Load up the match it plugin which provides smart % XML matching.
runtime macros/matchit.vim


" Custom settings per language.
"
augroup languagePreferences
    " Note, 'autocmd!' is used to clear out any existing definitions in
    " this auto-group. This prevents duplicate entries upon a live vimrc
    " reload.
    autocmd!
    autocmd FileType ace set include=^\s*import includeexpr=substitute(v:fname,'\\.','/','g') suffixesadd+=.ace makeprg=ttace\ -c\ % errorformat=E%n-ACE:\ %f:%l:%m
    autocmd FileType c,cpp set cindent
    autocmd FileType java set cindent cinoptions+=j1
    autocmd FileType msg set noautoindent noexpandtab nosmarttab
    autocmd FileType sh set textwidth=999
    autocmd FileType vim set textwidth=999
augroup END

" Custom file to syntax mappings.
"
augroup syntaxMappings
    autocmd!
    autocmd BufEnter *.{hh,cc,icc,tcc} set filetype=cxx
    autocmd BufEnter *.ace,*/API/utils/ttcs*,*/CS/utils/ttcs*,*/CS/test/test.*,*/ACE/utils/[tu]* set filetype=ace
    autocmd BufEnter Tmakefile,Trules,*/TCONFIG/*{api,clang,gcc,version,win}* set filetype=tmake
    autocmd BufEnter *.{ddm,ds} set filetype=ddm
    autocmd BufEnter *.{w3f,w3p,w3t} set filetype=ace
    autocmd BufEnter *.msg set filetype=msg
    autocmd BufEnter *.html set filetype=xml
augroup END

" Visual customizations for certain modes and window types.
"
augroup visualCustomizations
    autocmd!
    autocmd VimEnter,WinEnter,BufWinEnter,InsertLeave * call WindowFocus("Enter")
    autocmd WinLeave,FilterWritePost * call WindowFocus("Leave")
    autocmd InsertEnter * call InsertMode(v:insertmode)
    autocmd CursorMoved * call VisualMode()
    autocmd BufWinEnter quickfix setlocal cursorline colorcolumn=""
    autocmd FilterWritePre * call DiffMode()
augroup END


" Set the color scheme
"
colorscheme moonfly
