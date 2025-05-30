set autoindent        " Indented text
set autoread          " Pick up external changes to files
set autowrite         " Write files when navigating with :next/:previous
set background=dark   " Dark background by default
set backspace=indent,eol,start
set belloff=all       " Bells are annoying
set breakindent       " Wrap long lines *with* indentation
set breakindentopt=shift:2
" Copy to/from system clipboard
if has('unnamedplus')
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set colorcolumn=81,82 " Highlight 81 and 82 columns
set conceallevel=0    " Always show text normally
set complete=.,w,b    " Sources for term and line completions
set completeopt=menuone,noselect
set cryptmethod=blowfish2
" Highlight the current line in the number column
set cursorline
set cursorlineopt=number
set dictionary=/usr/share/dict/words
set diffopt=filler,internal,algorithm:histogram,indent-heuristic
set encoding=utf-8    " Correctly display Unicode symbols when using SSH
set expandtab         " Use spaces instead of tabs
set foldlevelstart=20
set foldmethod=indent " Simple and fast
set foldtext=''
set formatoptions=tcqj
set gdefault          " Always do global substitutes
" Use ripgrep as the grep tool
set grepprg=rg\ --vimgrep\ --smart-case
set grepformat=%f:%l:%c:%m,%f:%l:%m
set history=999       " Keep 999 changes of undo history
set infercase         " Smart casing when completing
set ignorecase        " Search in case-insensitively
set incsearch         " Go to search results immediately
set laststatus=2      " We want a statusline
set listchars=eol:$,tab:<‧>,trail:‧
set matchpairs=(:),{:},[:]
set mouse=a           " Mouse support in the terminal
set nobackup          " No backup files
set nocompatible
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
set path=**           " File search path
set pumheight=20      " Height of complete list
set relativenumber    " Show relative numbers
set shiftwidth=2      " Default indentation amount
set shortmess+=c      " Don't show insert mode completion messages
set shortmess+=s      " Don't show TOP/BOTTOM search messages
set shortmess+=F      " Don't show file info when editing
set shortmess+=I      " Don't show intro message
set shortmess+=S      " Don't show search count
set shortmess+=W      " Don't show written message
set signcolumn=number " Render signs in the number column
set showbreak=↳       " Use this to wrap long lines
set smartcase         " Case-smart searching
set smarttab          " Tab at the start of line inserts blanks
" When spell checking, assume word boundaries include 'CamelCasing'
set spelloptions=camel
set splitbelow        " Split below current window
" When horizonatally splitting windows keep text stabilized (no auto-scrolling)
if exists('&splitkeep')
    set splitkeep=topline
endif
set splitright        " Split window to the right
set tabstop=4         " Tab width
set textwidth=80      " Standard width before breaking
set timeoutlen=1500   " Give some time for multi-key mappings
" Don't set ttimeoutlen to zero otherwise it will break some Vim terminal
" behaviours
set ttimeoutlen=10
" Set the persistent undo directory on temporary private fast storage.
let s:undodir='/tmp/.vim_undodir_' . $USER
if !isdirectory(s:undodir)
    call mkdir(s:undodir, '', 0700)
endif
let &undodir=s:undodir
set undofile          " Maintain undo history
set updatetime=1000   " Certain plugins use this for CursorHold event triggering
set viminfo=          " No backups
set wildcharm=<Tab>   " Defines the trigger for 'wildmenu' in mappings
set wildmenu          " Nice command completions
set wildmode=full     " Complete the next full match
if has("patch-8.2.4325")
    set wildoptions=pum
endif
set wrap              " Wrap long lines

" Don't load these language providers since they needlessly slow down the
" loading of those same language files into the editor.
let g:loaded_node_provider = 1
let g:loaded_python3_provider = 1
let g:loaded_ruby_provider = 1
