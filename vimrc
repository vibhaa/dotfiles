filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')
set rtp+=~/.vim/bundle/Vundle.vim
set clipboard=unnamed
call vundle#begin()

set rtp+=$GOROOT/misc/vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'jlanzarotta/bufexplorer'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-surround'
Plugin 'airblade/vim-gitgutter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'godlygeek/tabular'
Plugin 'reedes/vim-pencil'
Plugin 'tpope/vim-fugitive'
" Plugin 'fatih/vim-go' "
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'tpope/vim-dispatch'
Plugin 'skywind3000/asyncrun.vim'
Plugin 'itchyny/lightline.vim'


" Syntax
Plugin 'w0rp/ale'
Plugin 'maximbaz/lightline-ale'
Plugin 'rust-lang/rust.vim'

"""A lot of this is from frank! thanks frank
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call vundle#end()            " required
filetype plugin indent on    " required
syntax enable
syntax on
set background=dark
set t_Co=16
let g:solarized_termcolors=16
""let g:solarized_visibility = high
let g:solarized_contrast = "high"
colorscheme solarized

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Airline (powerline)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = "powerlineish"
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerdtree (also from frank)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Uncomment to have NERDTree open on vim start
"autocmd vimenter * NERDTree

" Open NERDTree on the left
let g:NERDTreeWinPos = "right"

" Use NERDTree independent of tabs
map <Leader>n <plug>NERDTreeTabsToggle<CR>

let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" => Vim settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set number
hi Normal guibg=Blue ctermbg=None
highlight nonText ctermbg=None
hi Comment ctermfg=174


set mouse=a
set cursorline
highlight CursorLine guibg=Grey

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

let g:go_disable_autoinstall = 0
let g:go_version_warning = 0
" Search
set hlsearch
set incsearch

" No sounds! omg this is great
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Highlight
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Shortcuts (also from frank)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigating tabs
nnoremap th  :tabfirst<CR>
nnoremap tn  :tabnext<CR>
nnoremap tN  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tc  :tabnew<CR>
nnoremap tm  :tabm<Space>
nnoremap tx  :tabclose<CR>

let mapleader=","
" map <leader>r :autocmd BufWritePost * Make!
" map <leader>c :Copen<cr>

" => AsyncRun
" Set to non-zero height to open window automatically always
let g:asyncrun_open = 0
" Default status line
let g:asyncrun_status = "none"
" <space>b runs make in the background
nnoremap <Leader>b :AsyncRun make<cr>
" <space>r means automatically run make everytime file is written
map <Leader>r :autocmd BufWritePost * AsyncRun make<cr>
" <ctrl>c toggles the quicfix window
nnoremap <C-c> :call asyncrun#quickfix_toggle(10)<cr>


" => Lightline
" needed for display
set laststatus=2
" modify left side of line to add buildstatus from asyncrun
let g:lightline = {
    \ 'active' : {
    \    'left' : [ ['mode', 'paste'], ['readonly', 'filename', 'modified', 'buildstatus', 'linter_checking', 'linter_warnings', 'linter_errors'] ]
    \},
    \ 'component' : {
    \    'buildstatus' : '%{g:asyncrun_status}'
    \}
\}

let g:lightline#ale#indicator_checking = "✍"
let g:lightline#ale#indicator_warnings = "~"
let g:lightline#ale#indicator_errors = "✘"
let g:lightline.component_expand = {
    \ 'linter_checking' : 'lightline#ale#checking',
    \ 'linter_warnings' : 'lightline#ale#warnings',
    \ 'linter_errors' : 'lightline#ale#errors',
\}

nmap <silent> <C-j> :ALENext<cr>
nmap <silent> <C-k> :ALEPrevious<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile
