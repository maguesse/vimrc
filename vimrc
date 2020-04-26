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
" General
Plugin 'preservim/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'scrooloose/syntastic'
"Plugin 'tpope/vim-repeat'
"Plugin 'fholgado/minibufexpl.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-airline/vim-airline'
Plugin 'Valloric/YouCompleteMe' " /!\ Requires Vim 7.4.1578+ /!\

" Clojure
"Plugin 'tpope/vim-sexp-mappings-for-regular-people'
"Plugin 'guns/vim-sexp'
"Plugin 'guns/vim-clojure-static'
"Plugin 'tpope/vim-fireplace'
"Plugin 'tpope/vim-salve'

" Project Management
"Plugin 'tpope/vim-dispatch'
"Plugin 'tpope/vim-projectionist'
Plugin 'taglist.vim'
Plugin 'tasklist.vim'


" Python stuff
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/indentpython.vim'
"Plugin 'cespare/vim-toml'



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
" {{{
"let g:netrw_banner = 0
"let g:netrw_liststyle = 3
"let g:netrw_browse_split = 4
"let g:netrw_winsize = 25
"let g:netrw_atlv = 1
"let g:netrw_list_hide = '.*\.swp$,__py_cache_$'
"augroup ProjectDrawer
"    autocmd!
"    autocmd VimEnter * :Vexplore
"augroup END
" }}}
" MiniBuffer {{{
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1
" }}}
" TagList {{{
let Tlist_Ctags_Cmd='/usr/bin/ctags'    " Use Exuberant Ctags instead of GNU Ctags
map <C>+P :TlistToggle<CR>
" TaskList
map T :TaskList<CR>
" }}}
" Rainbow Parenthese {{{
if &rtp =~ 'rainbow_parentheses'
    au VimEnter * RainbowParenthesesToggle		" Toggle on/off
    au Syntax * RainbowParenthesesLoadRound		" () , default
    au Syntax * RainbowParenthesesLoadSquare	" []
    au Syntax * RainbowParenthesesLoadBraces	" {}
    au Syntax * RainbowParenthesesLoadChevrons	"<>
endif
" }}}
" Airline {{{
    let g:airline_powerline_fonts = 1
    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif
" }}}
" Vimgutter {{{
" }}}
" SimplyFold {{{
let g:SimpylFold_docstring_preview=1
" }}}

" YouCompleteMe {{{
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" }}}
" {{{ Fugitive / GitGutter
" Use fontawesome icons as signs
let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '>'
let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '^'
let g:gitgutter_sign_modified_removed = '<'
set updatetime=250
nmap <Leader>gn GitGutterNextHunk
nmap <Leader>gp GitGutterPrevHunk
" }}}
" {{{ NERDTree
" Open NERDTree when wim starts
autocmd vimenter * NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Toggle NERDTree with CTRL+n
map <C-n> :NERDTreeToggle<CR>
" Close vim when NERDTree is this only window left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
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
    \ set colorcolumn=120

au BufRead,BufNewFile *.py,*.pyw,*.sh match BadWhitespace /\s\+$/
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
au FileType python set omnifunc=pythoncomplete#Complete
au FileType python set foldmethod=indent " Folding - do not activate
au FileType python setlocal commentstring=#\ %s

au BufRead,BufNewFile *.toml setf dosini

let python_highlight_all=1
syntax on
"python with virtualenv support
" Not compatible ? with virtualenv handled by Poetry?
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
"  project_base_dir = os.environ['VIRTUAL_ENV']
"  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
"  execfile(activate_this, dict(__file__=activate_this))
"EOF
" }}}
" }}} FT

"vim:foldmethod=marker:foldlevel=2
