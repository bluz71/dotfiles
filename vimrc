" Useful insert mode commands:
"   Ctrl-o  for one time normal mode command (zz being most useful)
"   Ctrl-r  for insertion from a named register
"
" Useful cursor positioning and movement commands:
"   zt  move text under cursor to the top
"   zz  move text under cursor to the center
"   xb  move text under cursor to the bottom
"   H   move to top of screen
"   M   move to middle of screen
"   L   move to end of screen
"   gi  move back to where you were last editing
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
"   z=  Suggest spelling correction
"   ]s  Move to next spelling error
"   [s  Move to previous spelling error
"   zg  Add current word to dictionary
"   zw  Delete current word from dictionary
"
" Tag navigation:
"   Ctrl-]  find definition under cursor
"   Ctrl-t  return back from definition
"
" Substitute in visual block:
"   '<,'>s/\%Vfoo/bar/gc


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
set listchars=eol:$,tab:>-,trail:-
set mousehide
set nobackup
set nocompatible
set nohlsearch
set noshowcmd
set noshowmatch
set noshowmode
set noswapfile
set nowrap
set nowrapscan
set path=.,~/projects/**
set ruler
set shiftwidth=4
set smartcase
set smarttab
set splitbelow
set t_Co=256
set tabstop=4
set textwidth=79
set timeoutlen=2500
" Don't set ttimeoutlen to zero otherwise it will break terminal cursor block
" to I-beam and back functionality set by the t_SI and t_EI variables below.
set ttimeoutlen=10
set ttyfast
set ttymouse=xterm2
set viminfo=
" Disable beeps and flashes.
set visualbell t_vb=


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
    if version >= 703
        " Certain options are only available in Vim 7.3 and later.
        set cryptmethod=blowfish2
        set relativenumber
    endif
endif


" Set default value for the global variables.
"
let g:normalMode = 1

" Toggle highlighting and change color column if search highlighting has been
" enabled since highlighting may result in weird display issues. If
" highlighting is disabled then restore the color column.
"
function! Highlighting()
    set hlsearch!
    if version < 703
        " Only Vim 7.3 (and later) support the color column.
        return
    endif
    if &hlsearch == "nohlsearch"
        setlocal colorcolumn=81,82,83
    else
        setlocal colorcolumn=0
    endif
endfunction

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
    endif

    setlocal statusline+=%*\ %<%f\ %h%m%r
    if exists("g:loaded_fugitive")
        " Display Git branch if fugitive is loaded.
        setlocal statusline+=%4*\ %{fugitive#statusline()}\ 
    endif
    setlocal statusline+=%5*%=%-14.(%l,%c%V%)
    setlocal statusline+=%6*[%L]\ 
    setlocal statusline+=%7*%P
endfunction

" Intelligently set color column and indent markers based upon buffer type.
" For special buffers like: help, file list and diff we do not want color 
" column and indent marker styling, but for normal buffers we do.
"
function! Styling()
    if &diff || &buftype != "" || bufname("%") == "[BufExplorer]"
        setlocal conceallevel=0
        if &diff
            setlocal colorcolumn=0
        endif
    else
        setlocal colorcolumn=81,82,83
        if &conceallevel == 0
            setlocal conceallevel=2
        endif
    endif
endfunction

" A windows focus event has been triggered.
"
function! WindowFocus(mode)
    if a:mode == "Enter"
        call StatusLine("normal")
        call Styling()
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


" Terminal specific tweaks.
"
if !has("gui_running")
    if &term == 'screen-256color'
        " Change the cursor to an I-beam when in insert mode
        let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\\"
        let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\\"
        " Make CTRL-Left/Right work inside tmux.
        execute "set <xRight>=\e[1;*C"
        execute "set <xLeft>=\e[1;*D"
    else
        " Change the cursor to an I-beam when in insert mode
        let &t_SI = "\e[6 q"
        let &t_EI = "\e[2 q"
    endif
endif


" Keyboard mappings.
"
noremap <C-Right> ;
noremap <C-Left> ,
noremap ; :
let mapleader = ","
" Simpler keyboard navigation between splits.
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
" Remap refresh from Ctrl-l, no taken by above split navigation, to Alt-l.
if !has("gui_running")
    noremap l :redraw!<CR>
else
    noremap <A-l> :redraw!<CR>
endif
" Terminal specific mappings.
if !has("gui_running")
    " Need to remap existing Ctrl-l (refresh), use Alt-l instead. 
    noremap l :redraw!<CR> :echo "Screen has been redrawn"<CR>
else
    " Need to remap existing Ctrl-l (refresh), use Alt-l instead. 
    noremap <A-l> :redraw!<CR> :echo "Screen has been redrawn"<CR>
endif
" Y should behave like D and C, from cursor till end of line.
noremap Y y$
" Move vertically by visual line.
noremap j gj
noremap k gk
" Navigate between multiple opened files.
noremap <Space><Right> :n<CR>
noremap <Space><Left> :N<CR>
noremap <C-q> :confirm qall<CR>
noremap <F1> :set relativenumber!<CR>
noremap <F2> :w<CR>
noremap <F3> :%retab<CR> :%s/\s\+$//<CR>
" 'qq' starts a macro recording, 'q' stops it, <F4> runs the macro.
noremap <F4> @q
noremap <F5> :call Spelling()<CR>
noremap <F6> :source $MYVIMRC<CR> :echo "Reloaded vimrc"<CR>
"noremap <F7>
"noremap <F8>
noremap <F9> :set paste!<CR> :set lazyredraw!<CR> :echo "Toggled paste and lazyredraw to:" &lazyredraw<CR>
noremap <F11> :call Highlighting()<CR>
noremap <F12> :set list!<CR>
" Quickfix related mappings.
noremap <leader>m :make<CR>
noremap <leader><Up> :cp<CR>
noremap <leader><Down> :cn<CR>
" Splitting/tabbing and closing.
noremap <leader>s :split<CR>
noremap <leader>v :vsplit<CR>
noremap <leader>q :close<CR>
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

    Plugin 'kien/ctrlp.vim'
    " Use ag in CtrlP for listing files, very fast and respects .gitignore.
    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
    " Using ag is fast, we don't need to cache.
    let g:ctrlp_use_caching = 0
    " The match should be at the top of the list.
    let g:ctrlp_match_window_reversed = 0
    " Use CtrlP to search by tag.
    nnoremap <leader>. :CtrlPTag<CR>

    Plugin 'majutsushi/tagbar'
    noremap <leader>tb :TagbarToggle<CR>

    Plugin 'rking/ag.vim'
    let g:ag_mapping_message = 0
    let g:ag_highlight = 1
    noremap <leader>a :Ag<Space>
    " Note, use '-G extension$ <searchterm>' to restrict an Ag search to a
    " particular file extension.

    Plugin 'tpope/vim-fugitive'
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
    noremap <leader>gq :diffoff!<CR><C-w>h:bd<CR> :call Styling()<CR>
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

    " Ruby support, including code completion and automatic end insertion.
    Plugin 'vim-ruby/vim-ruby'
    Plugin 'tpope/vim-endwise'
    let g:rubycomplete_buffer_loading = 1
    let g:rubycomplete_classes_in_global = 1
    let g:rubycomplete_rails = 1
    let g:ruby_indent_access_modifier_style = 'indent'

    " Ruby on Rails support.
    "
    " Use 'gf' mapping to navigate objects inside a Rails project, use CTRL-O
    " and CTRL-I to navigate backward and forward.
    "
    " Use a visual selection in conjunction with ":Rextract <<partial-name>>"
    " to move a block of code from a view to a new partial.
    Plugin 'tpope/vim-rails'
    noremap <leader>em :Emodel<Space>
    noremap <leader>ev :Eview<Space>
    noremap <leader>ec :Econtroller<Space>
    noremap <leader>eh :Ehelper<Space>
    noremap <leader>etc :Efunctionaltest<Space>
    noremap <leader>eti :Eintegrationtest<Space>
    noremap <leader>etm :Eunittest<Space>

    " Rspec support.
    Plugin 'thoughtbot/vim-rspec'
    noremap <leader>rs :call RunNearestSpec()<CR>
    noremap <leader>rt :call RunCurrentSpecFile()<CR>
    noremap <leader>rl :call RunLastSpec()<CR>
    noremap <leader>ra :call RunAllSpecs()<CR>

    " Golang support.
    Plugin 'fatih/vim-go'
    " The 'gd' mapping (enabled by default) will jump to the declaration
    " under the cursor, use CTRL-O to return back.
    "
    " Note, when upgrading to a new version of Golang please run 
    " :GoUpdateBinaries to obtain the latest necessary auxiliary binaries
    " for the vim-go plugin.

    " Javascript support.
    Plugin 'jelera/vim-javascript-syntax'
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

    Plugin 'jlanzarotta/bufexplorer'
    noremap <leader>l :BufExplorer<CR>

    Plugin 'Yggdroot/indentLine'
    " Lighten the indent marker color.
    let g:indentLine_color_term = 236
    let g:indentLine_color_gui = "#303030"

    Plugin 'scrooloose/nerdtree'
    " Show line numbers and make the NERDTree window a little wider.
    let NERDTreeShowLineNumbers = 1
    let NERDTreeWinSize = 35
    " Replace arrows with text characters; not all terminal and font
    " combinations provide arrows.
    let g:NERDTreeDirArrowExpandable = "+"
    let g:NERDTreeDirArrowCollapsible = "~"
    " Only display the base directory name in the NERDTree status line.
    " Displaying the full working path, which is the NERDTree default, results
    " in ugly scrolled text.
    let NERDTreeStatusline = " %{ fnamemodify(getcwd(), ':t') }"
    noremap <leader>n :NERDTreeToggle<CR>

    Plugin 'ervandew/supertab'
    " Play nice with other plugins and force top-to-bottom tab completion.
    let g:SuperTabDefaultCompletionType = "context"
    let g:SuperTabContextDefaultCompletionType = "<c-n>"

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
    autocmd FileType eruby set formatoptions=cq shiftwidth=2
    " Setup indent lines for tab formatted Golang code. Note, the indentLine 
    " plugin will not show markers for tab formatted code, so we need to mimic
    " what that plugin does here using listchars and highlighting.
    autocmd FileType go set list listchars=tab:\¦\ 
    autocmd FileType go highlight SpecialKey ctermbg=bg guibg=bg ctermfg=236 guifg=#303030
    " Match it navigation is broken for HTML, this Stack Overflow tip fixes it.
    autocmd FileType html let b:match_words = '<\(\w\w*\):</\1,{:}'
    autocmd FileType html set shiftwidth=2
    autocmd FileType java set cindent cinoptions+=j1 foldmethod=syntax
    autocmd FileType ruby set formatoptions=cq shiftwidth=2 makeprg=ruby\ -w\ %
    autocmd FileType sh set textwidth=999
    autocmd FileType vim set textwidth=999
    autocmd FileType xml set shiftwidth=2
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
    autocmd CursorMoved * call VisualMode()
    autocmd BufWinEnter quickfix setlocal cursorline colorcolumn=0
    autocmd FileType nerdtree setlocal conceallevel=0 colorcolumn=0
    autocmd FilterWritePre * call Styling()
    if v:progname != "vi"
        autocmd FileType * IndentLinesReset
    endif
    autocmd BufLeave,FocusLost,InsertLeave * silent! wall
augroup END


" Set the color scheme
"
colorscheme moonfly
