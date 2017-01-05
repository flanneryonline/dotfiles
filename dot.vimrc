
"SETUP
set encoding=utf-8

" Set location so we can set variables accordingly
let g:os = "linux"
if has("win32") || has("win64")
    let g:os="win"
endif

" repalce backslash with forward slash
"if g:os != "win"
"    set shellslash
"endif

if version >= 704 && has("patch-7.4-399")
    set cryptmethod=blowfish2
elseif version >= 703
    set cryptmethod=blowfish
endif

"Settings
syntax on
set relativenumber
set number
set modelines=0
set nomodeline

" UI Settings: {{{2 ----------------------------------------------------------

set cmdheight=2
set colorcolumn=+1
set cursorline
set display+=lastline
set fillchars=
set guioptions=egcrb
set laststatus=2
set lazyredraw
set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$
set noequalalways
set noerrorbells
set novisualbell
set ruler
set showcmd
set showmatch
set showmode
set synmaxcol=1000
set winminheight=0
set winminwidth=0

" Settings: {{{1 =============================================================

set browsedir=buffer
set hidden
set history=1000
set mouse=a
set shortmess=filmnrxoOtTI

set backspace=indent,eol,start
set confirm
set foldmethod=manual
set formatoptions=tcrqn
if v:version > 703 || v:version == 703 && has("patch541")
    set formatoptions+=j
endif
set nojoinspaces
set nowrap
set nrformats-=octal
set scrollopt=jump,ver,hor
set sidescroll=10
set splitbelow
set splitright
set virtualedit=block
set whichwrap+=<,>,h,l

" Terminal
if !has("gui_running")
    set t_Co=256
    set term=xterm-256color
    set ttymouse=xterm2
endif

" Indentation Settings: {{{2 -------------------------------------------------

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set shiftround

" File Settings: {{{2 --------------------------------------------------------

nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

filetype plugin indent on
set autoread
set fileformats=unix,dos
set nobackup
set nowritebackup
set noswapfile

let g:mapleader = "\<Space>"
let g:maplocalleader = "\<Space>"

" Indenting in visual mode
xnoremap <silent> <tab> >gv
xnoremap <silent> <s-tab> <gv
xnoremap <silent> > >gv
xnoremap <silent> < <gv

" Backspace
xnoremap <BS> d
if g:os == "osx"
    inoremap <A-BS> <C-w>
elseif g:os == "win"
    inoremap <C-BS> <C-w>
endif

" paste in command line
cnoremap <C-V> <C-R>*

" Make x not yank to register
noremap x "_x
xnoremap p pgvy

"UI Settings 

if has("gui_running")
    set title
    set lines=40 columns=165
    if g:os == "win"
        set guifont=Consolas:h10
        set guioptions+=r
    endif
else
    set guioptions+=aA
endif

" Use system clipboard
if has("clipboard")
    if has("unnamedplus")
        set clipboard=unnamedplus,unnamed
    else
        set clipboard=unnamed
    endif
else
    set clipboard=
endif

" Save command typos
command! Q q
command! W w
command! Wq wq
command! WQ wq

" Search Settings: {{{2 ------------------------------------------------------

set ignorecase
set incsearch
set nohlsearch
set smartcase

" Indentation Settings: {{{2 -------------------------------------------------

set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set smarttab
set shiftround

" Completion Settings: {{{2 --------------------------------------------------

set complete=.,w,b,u
set completeopt=longest,menu
set wildignorecase
set wildmenu
set wildmode=longest:full,full
" set wildmode=list:longest,full
set pumheight=16

set wildignore+=*.pyc,*.pyd,*.pyo " python files
set wildignore+=*.bmp,*.gif,*.ico,*.png,*.jpg,*.jpeg " images
set wildignore+=*.csproj,*.pdb,*.resx,*.sln,*.suo " visual studio
set wildignore+=*.doc,*.docx,*.pdf,*.xls,*.xlsx " documents
set wildignore+=*.dll,*.exe,*.lib,*.map,*.o,*.obj,*.so " binaries
set wildignore+=*.h5,*.gz " compressed files
set wildignore+=*.bak,*~,tmp " misc files
set wildignore+=.svn\*,.git\* " scm
set wildignore+=cscope.out,tags " vim

" Plugins: {{{2---------------------------------------------------------------

if g:os == "win"
    let g:plug_dir = "~/vimfiles/autoload/plug.vim"
    let g:luc_dir = "~/vimfiles/bundle/vim-lucius/colors/lucius.vim"
else
    let g:plug_dir = "~/.vim/autoload/plug.vim"
    let g:luc_dir = "~/.vim/bundle/vim-lucius/colors/lucius.vim"
endif

if !empty(glob(g:plug_dir))
    if has("win32") || has("win64")
        call plug#begin('~/vimfiles/bundle')
    else
        call plug#begin('~/.vim/bundle')
    endif

    "must have python
    if has('python') || has('python3')
        "must have version 8
        if v:version >= 800 
            Plug 'maralla/completor.vim'
        endif
    endif

    "Themes
    Plug 'jonathanfilip/vim-lucius'         "Jon's theme
    Plug 'vim-airline/vim-airline'          "Info bar
    Plug 'vim-airline/vim-airline-themes'   "Info bar theme
    
    "Files
    Plug 'ctrlpvim/ctrlp.vim'               "Search files/buffers
    Plug 'scrooloose/nerdtree'              "file tree
    Plug 'Xuyuanp/nerdtree-git-plugin'      "git integration
    Plug 'tpope/vim-fugitive'               "git plugin

    "Syntax/Highlights
    Plug 'scrooloose/syntastic'             "syntax checking
    Plug 'PProvost/vim-ps1'                 "powershell highlighting
    Plug 'ekalinin/Dockerfile.vim'          "Dockerfile highlighting
    Plug 'Shougo/echodoc.vim'               "function completion
    Plug 'OmniSharp/omnisharp-vim'          "c# .net

    "Helper
    Plug 'tpope/vim-surround'               "change surrounding text
    
    call plug#end()
endif

" Don't load theme if plugins have not been download yet
if !empty(glob(g:luc_dir))
    colorscheme lucius
    LuciusLightHighContrast
endif

" Airline: {{{2 --------------------------------------------------------------

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_inactive_collapse=1

let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#enabled = 0

let g:airline#extensions#default#layout = [
    \ [ 'a', 'c' ],
    \ [ 'x', 'y', 'z', 'error', 'warning' ]
    \ ]


" CtrlP: {{{2 ----------------------------------------------------------------

let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_custom_ignore = {
            \ 'dir': 'tests$',
            \ 'file': '',
            \ }
let g:ctrlp_extensions = ['buffertag']
let g:ctrlp_lazy_update = 0
let g:ctrlp_match_window='position:bottom,order:btt,min:1,max:10,results:100'
let g:ctrlp_show_hidden = 0
let g:ctrlp_switch_buffer = 'vh'
let g:ctrlp_working_path_mode = 0

nnoremap <silent> <leader>ff :CtrlP<CR>
nnoremap <silent> <leader>fb :CtrlPBuffer<CR>
nnoremap <silent> <leader>fr :CtrlPMRU<CR>
nnoremap <silent> <leader>ft :CtrlPBufTag<CR>

nnoremap <silent> <leader>e :CtrlP<CR>
nnoremap <silent> <leader>b :CtrlPBuffer<CR>

" Syntastic: {{{2-------------------------------------------------------------

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" NERDTree: {{{2--------------------------------------------------------------

autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
nnoremap <C-n> :NERDTreeToggle<CR>

" Completer: {{{2--------------------------------------------------------------

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"

if g:os == "win"
    let g:completor_python_binary = '~/AppData/Local/Programs/Python/Python35-32/python.exe'
    let g:completor_clang_binary = 'C:/Program Files (x86)/LLVM/bin/clang.exe'
else
    if has('python3')
        let g:completor_python_binary = '/usr/local/bin/python3'
    else
        let g:completor_python_binary = '/usr/local/bin/python'
    endif
    let g:completor_clang_binary = '/usr/bin/clang'
endif

