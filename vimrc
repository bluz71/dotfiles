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
set background=dark   " Dark background by default
set backspace=indent,eol,start
set belloff=all       " Bells are annoying
set breakindent       " Wrap long lines *with* indentation
set breakindentopt=shift:2
if has('unnamedplus') " Copy to/from system clipboard
    set clipboard=unnamed,unnamedplus
else
    set clipboard=unnamed
endif
set colorcolumn=81,82 " Highlight 81 and 82 columns
set conceallevel=0    " Always show text normally
set complete=.,w,b    " Sources for term and line completions
set completeopt=menu,menuone,noinsert,noselect
set dictionary=/usr/share/dict/words
if has('nvim-0.3.2') || has('patch-8.1.0360')
    set diffopt=filler,internal,algorithm:histogram,indent-heuristic
endif
set expandtab         " Use spaces instead of tabs
set foldlevelstart=20
set foldmethod=indent " Simple and fast
set foldtext=''
set formatoptions=cqj " Default format options
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
set relativenumber    " Show relative numbers
set shiftwidth=2      " Default indentation amount
set shortmess+=c      " Don't show insert mode completion messages
set shortmess+=I      " Don't show intro message
set signcolumn=number " Render signs in the number column
set showbreak=↳       " Use this to wrap long lines
set smartcase         " Case-smart searching
set smarttab          " Tab at the start of line inserts blanks
" When spell checking, assume word boundaries include 'CamelCasing'.
if exists('&spelloptions')
    set spelloptions=camel
endif
set splitbelow        " Split below current window
set splitright        " Split window to the right
set tabstop=4         " Tab width
set termguicolors     " Enable 24-bit color support for terminal Vim
set textwidth=80      " Standard width before breaking
set timeoutlen=1500   " Give some time for multi-key mappings
" Don't set ttimeoutlen to zero otherwise it will break some Vim terminal
" behaviours
set ttimeoutlen=10
" Set the persistent undo directory on temporary private fast storage.
let s:undoDir='/tmp/.undodir_' . $USER
if !isdirectory(s:undoDir)
    call mkdir(s:undoDir, '', 0700)
endif
let &undodir=s:undoDir
set undofile          " Maintain undo history
set updatetime=1000   " Certain plugins use this for CursorHold event triggering
set viminfo=          " No backups
set wildcharm=<Tab>   " Defines the trigger for 'wildmenu' in mappings
set wildmenu          " Nice command completions
set wildmode=full     " Complete the next full match
set wrap              " Wrap long lines

" Options specific to Neovim or Vim.
if has('nvim')
    set inccommand=nosplit
    set list
    set listchars=tab:\ \ ,trail:-
else
    set cryptmethod=blowfish2
    set listchars=eol:$,tab:>-,trail:-
    if exists('&cursorlineopt')
        set cursorline
        set cursorlineopt=number
    endif
endif


"===========================================================
" FUNCTIONS
"
" ~/dotfiles/vim/autoload - custom functions
"===========================================================


"===========================================================
" TERMINAL VIM SETTINGS
"===========================================================
runtime custom/terminal.vim


"===========================================================
" MAPPINGS
"===========================================================
runtime custom/mappings.vim


"===========================================================
" PLUGINS
"===========================================================

" Initial 'vim-plug' installation:
"  % curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

" Initialize vim-plug.
call plug#begin('~/.vim/plugged')

"-----------------------------
" Color scheme plugins
"-----------------------------
Plug 'bluz71/vim-moonfly-colors'
    runtime custom/moonfly.vim " Options must be set before colorscheme call
Plug 'bluz71/vim-nightfly-guicolors'
    runtime custom/nightfly.vim " Options must be set before colorscheme call

"-----------------------------
" Style plugins
"-----------------------------
Plug 'bluz71/vim-moonfly-statusline'
    " ~/dotfiles/vim/plugin/moonfly-statusline.vim - options
Plug 'gcmt/taboo.vim'
    " ~/dotfiles/vim/plugin/taboo.vim - options
if has('nvim')
    Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'lua'}
    " ~/dotfiles/vim/plugin/indent-blankline.vim - options
endif

"-----------------------------
" Behavior plugins
"-----------------------------
Plug 'nelstrom/vim-visual-star-search'
Plug 'michaeljsmith/vim-indent-object'
Plug 'wellle/targets.vim'
Plug 'ackyshake/VimCompletesMe'
Plug 'gregsexton/MatchTag'
Plug 'mhinz/vim-grepper'
    " ~/dotfiles/vim/plugin/grepper.vim - options, mappings
    " ~/dotfiles/vim/after/plugin/grepper.vim - overrides
Plug 'chaoren/vim-wordmotion'
    " ~/dotfiles/vim/after/plugin/wordmotion.vim - overrides
Plug 'tmsvg/pear-tree'
    " ~/dotfiles/vim/plugin/pear-tree.vim - options, mappings
Plug 'tommcdo/vim-lion'
    " ~/dotfiles/vim/plugin/lion.vim - options
Plug 'rhysd/clever-f.vim'
    " ~/dotfiles/vim/plugin/clever-f.vim - options
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-unimpaired'
    " ~/dotfiles/vim/after/plugin/unimpaired.vim - overrides
Plug 'mbbill/undotree'
    " ~/dotfiles/vim/plugin/undotree.vim - options, mappings
    " ~/dotfiles/vim/after/ftplugin/undotree.vim - options
Plug '907th/vim-auto-save'
    " ~/dotfiles/vim/plugin/auto-save.vim - options
" if has('nvim')
"     Plug 'steelsojka/pears.nvim'
" endif

"-----------------------------
" Filesystem plugins
"-----------------------------
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
    " ~/dotfiles/vim/plugin/fzf.vim - options, mappings
    " ~/dotfiles/vim/after/ftplugin/fzf.vim - options
Plug 'pbogut/fzf-mru.vim'
    " ~/dotfiles/vim/plugin/fzf-mru.vim - options, mappings
Plug 'lambdalisue/fern.vim'
    " ~/dotfiles/vim/plugin/fern.vim - options, mappings
    " ~/dotfiles/vim/after/ftplugin/fern.vim - options
Plug 'lambdalisue/fern-git-status.vim'
    " ~/dotfiles/vim/plugin/fern-git-status.vim - options

"-----------------------------
" Development plugins
"-----------------------------
Plug 'dense-analysis/ale'
    " ~/dotfiles/vim/plugin/ale.vim - options, mappings
if has('nvim')
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'neovim/nvim-lspconfig'
    Plug 'hrsh7th/nvim-compe'
    " ~/dotfiles/vim/plugin/compe.vim - options, mappings
    Plug 'nvim-lua/plenary.nvim'
    Plug 'lewis6991/gitsigns.nvim'
endif
Plug 'tpope/vim-projectionist'
    " ~/dotfiles/vim/plugin/projectionist.vim - mappings
Plug 'janko-m/vim-test'
    " ~/dotfiles/vim/plugin/test.vim - options, mappings
Plug 'hrsh7th/vim-vsnip'
    " ~/dotfiles/vim/plugin/vsnip.vim - options, mappings
    " ~/dotfiles/vim/vsnip - custom snippets
Plug 'editorconfig/editorconfig-vim'
    " ~/dotfiles/vim/plugin/editorconfig.vim - options
Plug 'tpope/vim-bundler'
    " Run 'gem ctags' to generate ctags for installed gems (required just once).
Plug 'tpope/vim-rails'
    " ~/dotfiles/vim/plugin/rails.vim - mappings
Plug 'dart-lang/dart-vim-plugin'
Plug 'vim-crystal/vim-crystal'

"-----------------------------
" Misc plugins
"-----------------------------
Plug 'christoomey/vim-tmux-navigator'
    " ~/dotfiles/vim/plugin/tmux-navigator.vim - options, mappings
Plug 'tpope/vim-obsession'
    " ~/dotfiles/vim/plugin/obsession.vim - mappings
Plug 'lifepillar/vim-cheat40'
    " ~/dotfiles/vim/plugin/cheat40.vim - options, mappings
Plug 'tweekmonster/startuptime.vim'
if has('nvim')
    Plug 'bfredl/nvim-miniyank'
        " ~/dotfiles/vim/plugin/miniyank.vim - mappings
    Plug 'norcalli/nvim-colorizer.lua'
        " ~/dotfiles/vim/lua/nvim-colorizer.lua - options, mappings
    " Workaround for Neovim bug, see:
    "   https://github.com/neovim/neovim/issues/12587
    "   https://github.com/lambdalisue/fern.vim/issues/120
    Plug 'antoinemadec/FixCursorHold.nvim'
endif

" Finalize vim-plug.
call plug#end()


" Load Neovim Lua-based plugin configurations.
if has('nvim')
    lua require'colorizer-config'
    lua require'compe-config'
    lua require'treesitter-config'
    "lua require'pears-config'
    " Do not load up certain plugins when in diff mode.
    if !&diff
        lua require'lsp-config'
        lua require'gitsigns-config'
    endif
endif


" Load up the match it plugin which provides smart % XML/HTML matching.
runtime macros/matchit.vim


"===========================================================
" AUTOCMDS
"===========================================================
runtime custom/autocmds.vim
    " ~/dotfiles/vim/ftplugin       - file type options, mappings
    " ~/dotfiles/vim/after/ftplugin - file type overrides


"===========================================================
" COLOR SCHEME
"===========================================================
if filereadable(expand('~/.colorscheme'))
    exec 'colorscheme ' . readfile(expand('~/.colorscheme'))[0]
else
    colorscheme moonfly
endif
