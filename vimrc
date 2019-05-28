set nocompatible  " required
filetype off      " required

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %
autocmd! bufwritepost vimrc source %

set encoding=utf-8
set fileencoding=utf-8
set termencoding=utf-8

set rtp+=~/.vim/bundle/Vundle.vim
set updatetime=100
call vundle#begin()

" Plugins {{{
Plugin 'VundleVim/Vundle.vim' " required

Plugin 'vim-airline/vim-airline'

"Plugin 'https://github.com/tpope/vim-sexp-mappings-for-regular-people'
"Plugin 'https://github.com/guns/vim-sexp'
"Plugin 'https://github.com/tpope/vim-repeat'
"Plugin 'https://github.com/tpope/vim-surround'
"Plugin 'https://github.com/guns/vim-clojure-static'
"Plugin 'https://github.com/tpope/vim-fireplace'
"Plugin 'https://github.com/tpope/vim-salve'
Plugin 'https://github.com/kien/rainbow_parentheses.vim'
"Plugin 'https://github.com/tpope/vim-projectionist'
"Plugin 'https://github.com/tpope/vim-dispatch'

Plugin 'fholgado/minibufexpl.vim'
Plugin 'taglist.vim'
Plugin 'tasklist.vim'

"Plugin 'tmhedberg/SimpylFold'

" Python stuff
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'

Plugin 'scrooloose/syntastic'


" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'jnurmine/Zenburn'
Plugin 'sjl/badwolf'

"Git stuff
Plugin 'tpope/vim-fugitive'
Plugin 'jreybert/vimagit'
Plugin 'airblade/vim-gitgutter'

call vundle#end()
" }}}
" Default UI Editor settings {{{
set number
set relativenumber
set showmatch " show matching [{()}]
set cursorline
set textwidth=119
set colorcolumn=120

set showcmd
set wildmenu " automcomplete for command menu
set lazyredraw " redraw only when need to

set backspace=indent,eol,start

set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab


if has('mouse')
    set mouse=a
endif

let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "linux" && !has('nvim')
    set ttymouse=xterm
endif

filetype plugin indent on
syntax on
highlight BadWhitespace ctermbg=red guibg=red
" }}}
" Folding {{{
set foldmethod=syntax
set foldnestmax=2
set foldcolumn=2
" Use <space> to fold/unfold
nnoremap <space> za
vnoremap <space> za

" Unfold all when opening a file
au BufRead * normal zR
" }}}
" Search configuration {{{
set hlsearch
set incsearch
set ignorecase
set smartcase
" }}}
" Colorscheme {{{
try
    set background=dark
    colorscheme solarized
    call togglebg#map("<F5>")
catch
    try
        colorscheme badwolf
    catch
    endtry
endtry
" }}}
" Movement {{{
" Enable wrap movement by default
nnoremap j gj
nnoremap k gk
nnoremap down dj
nnoremap up gk
" Disable Arrows key in normal mode
map <up>    <nop>
map <down>  <nop>
map <left>  <nop>
map <right> <nop>
" Disable Arrows key in insert mode
imap <up>    <nop>
imap <down>  <nop>
imap <left>  <nop>
imap <right> <nop>
" }}}
" Windows navigation {{{
nnoremap <C-J> <C-W><C-J>       " Down
nnoremap <C-K> <C-W><C-K>       " Up
nnoremap <C-H> <C-W><C-H>       " Left
nnoremap <C-L> <C-W><C-L>       " Right
nnoremap <C-down> <C-W><C-J>    " Down
nnoremap <C-up> <C-W><C-K>      " Up
nnoremap <C-left> <C-W><C-H>    " Left
nnoremap <C-right> <C-W><C-L>   " Right

noremap <C-S-up> <C-W>+         " Increase current window height
noremap <C-S-down> <C-W>-       " Decrease current window height
noremap <C-S-right> <C-W>>      " Increase current window width
noremap <C-S-left> <C-W><       " Decrease current window width

map <F6> <C-W>w
map <F7> <C-W>W
" }}}
" Keybings {{{
let mapleader=","

inoremap jk <esc>

nnoremap <leader>ev :vsp $MYVIMRC<CR>
" }}}
" Plugins configuration {{{
" MiniBuffer {{{
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
" }}}
" TagList {{{
let Tlist_Ctags_Cmd='/usr/bin/ctags'    " Use Exuberant Ctags instead of GNU Ctags
map P :TlistToggle<CR>
" TaskList
map T :TaskList<CR>
" }}}
" Rainbow Parenthese {{{
au VimEnter * RainbowParenthesesToggle		" Toggle on/off
au Syntax * RainbowParenthesesLoadRound		" () , default
au Syntax * RainbowParenthesesLoadSquare	" []
au Syntax * RainbowParenthesesLoadBraces	" {}
au Syntax * RainbowParenthesesLoadChevrons	"<>
" }}}
" Airline {{{
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
" }}}
" Vimgutter {{{
" }}}
" }}}
" Filetypes configuration {{{
" ---- Python {{{
au BufRead,BufNewFile *.py
    \ set tabstop=4         |
    \ set softtabstop=4     |
    \ set shiftwidth=4      |
    \ set textwidth=79      |
    \ set expandtab         |
    \ set autoindent        |
    \ set fileformat=unix   |
    \ set colorcolumn=80

au BufRead,BufNewFile *.py,*.pyw,*.sh match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python set foldmethod=indent " Folding - do not activate
au FileType python setlocal commentstring=#\ %s

let python_highlight_all=1
" }}}
" }}} FT

" vim:foldmethod=marker:foldlevel=0
