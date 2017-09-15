set nocompatible

" ---------------------------------------------------------------------------- "
" Plugins                                                                      "
" ---------------------------------------------------------------------------- "

if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd vimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'chiel92/vim-autoformat'
Plug 'ciaranm/detectindent'
Plug 'junegunn/fzf',                        { 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'mhinz/vim-signify'
Plug 'mhinz/vim-startify',                  { 'do': 'mkdir -p $HOME/.vim/files/info/' }
Plug 'moll/vim-bbye'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdtree',                 { 'on': ['NERDTreeFind', 'NERDTreeToggle'] }

Plug 'vim-scripts/doxygentoolkit.vim',      { 'for': 'cpp' }
Plug 'octol/vim-cpp-enhanced-highlight',    { 'for': 'cpp' }
Plug 'twinside/vim-hoogle',                 { 'for': 'haskell' }
Plug 'eagletmt/ghcmod-vim',                 { 'for': 'haskell' }
Plug 'eagletmt/neco-ghc',                   { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim',       { 'for': 'haskell' }
Plug 'fatih/vim-go',                        { 'for': 'go', 'do': ':GoInstallBinaries' }
Plug 'jdevlieghere/llvm.vim',               { 'for': 'llvm' }
Plug 'racer-rust/vim-racer',                { 'for': 'rust' }
Plug 'rust-lang/rust.vim',                  { 'for': 'rust' }

Plug 'godlygeek/tabular' | Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }

Plug 'altercation/vim-colors-solarized'
Plug 'nanotech/jellybeans.vim'
Plug 'chriskempson/base16-vim'

if has("python")
    Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer --gocode-completer --tern-completer --racer-completer' }
endif

call plug#end()

" ---------------------------------------------------------------------------- "
" (G)UI                                                                        "
" ---------------------------------------------------------------------------- "

try
    colorscheme solarized
catch
endtry

if has("gui_running")
    set guifont=Source\ Code\ Pro\ Medium:h13
    set antialias
end

" ---------------------------------------------------------------------------- "
" General Settings                                                             "
" ---------------------------------------------------------------------------- "

filetype plugin indent on       " Enable file type support
syntax enable                   " Enable syntax highlighting

set autoread                    " Auto reload file after external command
set background=dark             " Use a dark background
set backspace=indent,eol,start  " Delete over line breaks
set binary                      " Enable binary support
set clipboard=unnamed           " Use system clipboard
set cm=blowfish                 " Better encryption algorithm
set colorcolumn=80,120          " Show ruler columns
set encoding=utf-8              " Use UTF-8 encoding
set hidden                      " Hide buffers instead of closing them
set laststatus=2                " Always display the status line
set nofoldenable                " Disable folding
set nolazyredraw                " Always redraw
set noshowmode                  " Don't show mode
set nu                          " Show line numbers
set pastetoggle=<F2>            " Toggle paste mode with F2
set ruler                       " Show ruler
set showcmd                     " Show current command
set showmatch                   " Show matching bracket/parenthesis/etc
set showmode                    " Show current mode
set tags=tags;                  " Find tags recursively
set title                       " Change terminal title
set ttyfast                     " Fast terminal
set wildmenu                    " Visual autocomplete for command menu
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)

" Temp Files
set nobackup                    " No backup file
set noswapfile                  " No swap file

" Search
set incsearch                   " Incremental search
set hlsearch                    " Highlight matches
set ignorecase                  " Case-insensitive search...
set smartcase                   " ... unless search contains uppercase letter

" Indentation
set smarttab                    " Better tabs
set smartindent                 " Inserts new level of indentation
set autoindent                  " Copy indentation from previous line
set tabstop=2                   " Columns a tab counts for
set softtabstop=2               " Columns a tab inserts in insert mode
set shiftwidth=2                " Columns inserted with the reindent operations
set shiftround                  " Always indent by multiple of shiftwidth
set expandtab                   " Always use spaces instead of tabs

" Key sequence timeout
set ttimeout                    " Enable time out
set ttimeoutlen=100             " Set timeout time to 100 ms

" Wrapping
set nowrap                      " Don't wrap long lines
set linebreak                   " When wrapping, only at certain characters
set textwidth=0                 " Turn off physical line wrapping
set wrapmargin=0                " Turn off physical line wrapping

" Joining
set nojoinspaces                " Only one space when joining lines
set formatoptions+=j            " Remove comment leader when joining lines

" Scroll
set sidescrolloff=3             " Keep at least 3 lines left/right
set scrolloff=3                 " Keep at least 3 lines above/below

" Mouse
set mousehide                   " Hide mouse when typing
set mouse=nicr                  " Disable mouse

" Disable bell
set visualbell                  " Disable visual bell
set noerrorbells                " Disable error bell

" Treat given characters as a word boundary
set iskeyword-=.                " '.' is an end of word designator
set iskeyword-=#                " '#' is an end of word designator

" Splits
set splitbelow                  " Horizontal split below
set splitright                  " Vertical split right

" Spell checking
set spelllang=en_us             " English as default language
set spell                       " Enable by default

" Vim Info
set viminfo='100,n$HOME/.vim/files/info/viminfo

" Invisible characters
set nolist                      " Hide by default
set listchars=tab:▸\ ,trail:-,extends:>,precedes:<,nbsp:⎵,eol:¬

" Completion menu
set completeopt=longest,menuone " Inserts the longest common text and
                                " show menu even with only one item

" Omni-completion
set omnifunc=syntaxcomplete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" History
set history=1000                " Remember more commands
if has('persistent_undo')
    set undofile                " Persistent undo
    set undodir=~/.vim/undo     " Location to store undo history
    set undolevels=1000         " Max number of changes
    set undoreload=10000        " Max lines to save for undo on a buffer reload
endif

" Same color for sign column and line numbers
highlight clear SignColumn

" Use italics
"highlight Comment cterm=italic
"highlight htmlArg cterm=italic

" ---------------------------------------------------------------------------- "
" Key Mapping
" ---------------------------------------------------------------------------- "

" Save a keystroke
nnoremap ; :

" Avoid the ESC key
inoremap jj <Esc>

" Typos
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa

" Toggle spell check
noremap <F7> :setlocal spell!<CR>

" Save file which you forgot to open with sudo
cnoremap w!! w !sudo tee % >/dev/null

" Wrap the current visual selection
vnoremap Q gq

" Wrap the current paragraph
nnoremap Q gqap

" Search for current visual selection
vnoremap // y/<C-R>"<CR>

" Map leader to space
let mapleader=" "

" Copy file path to clipboard
nnoremap <leader>yy :let @+=expand("%:p")<CR>

" Copy filename:linenumber to clipboard (for setting breakpoints)
nnoremap <leader>bp :let @+=expand('%:t') . ':' . line(".")<CR>

" Cycle through buffers with (CTRL +) tab
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>

" Toggle hidden characters
nnoremap <silent> <leader>l :set list!<CR>

" Close current window
nnoremap <silent> <Leader>wd <C-w>q

" ---------------------------------------------------------------------------- "
" Auto Commands                                                                "
" ---------------------------------------------------------------------------- "

" Use Doxygen style comments in C and C++
autocmd FileType c,cpp set comments^=:///

" Write directly to the original file when editing the crontab
autocmd FileType crontab setlocal nobackup nowritebackup

" Recognize NASM filetype
autocmd BufRead,BufNewFile *.nasm set filetype=nasm

" Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Watch my .vimrc
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup end

" ---------------------------------------------------------------------------- "
" Plugin Configuration                                                         "
" ---------------------------------------------------------------------------- "

" vim-bbye
nnoremap <silent> <Leader>q :Bdelete<CR>
nnoremap <silent> <Leader>bd :Bdelete!<CR>

" vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_update_on_bufenter = 0

" vim-startify
let g:startify_change_to_dir = 0

" fzf.vim
let g:fzf_buffers_jump=1
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-b> :Buffers<CR>
vnoremap ag y :Ag <C-R>"<CR>        " Ag for visual selection

" vim-airline
let g:airline_powerline_fonts=1
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

" detectindent
let g:detectindent_preferred_expandtab=1
let g:detectindent_preferred_indent=2
autocmd BufReadPost * :DetectIndent

" tagbar
nnoremap <F8> :TagbarToggle<CR>
let g:tagbar_autofocus=0
let g:tagbar_right=1
let g:tagbar_width=35
autocmd FileType * nested :call tagbar#autoopen(0)

" nerdtree
let g:NERDTreeIgnore=['\.job$', '^CVS$', '\.orig', '\~$']
let g:NERDTreeShowHidden=1
let g:NERDTreeStatusline="%f"
let g:NERDTreeWinPos="left"
let g:NERDTreeWinSize=35

nnoremap <F9> :NERDTreeFind<CR>
nnoremap <F10> :NERDTreeToggle<CR>

autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim-autoformat
let g:formatters_python = ['yapf', 'autopep8']
let g:formatter_yapf_style = 'pep8'

" doxygentoolkit.vim
let g:DoxygenToolkit_commentType = "C++"

" youcompleteme
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_filetype_blacklist={
            \ 'vim' : 1,
            \ 'tagbar' : 1,
            \ 'qf' : 1,
            \ 'notes' : 1,
            \ 'markdown' : 1,
            \ 'md' : 1,
            \ 'unite' : 1,
            \ 'text' : 1,
            \ 'vimwiki' : 1,
            \ 'pandoc' : 1,
            \ 'infolog' : 1,
            \ 'objc' : 1,
            \ 'mail' : 1
            \}

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_aggregate_errors = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_cpp_checkers = []
let g:syntastic_javascript_checkers = ['jshint', 'jslint']
let g:syntastic_python_checkers = ['pylint','pyflakes']
