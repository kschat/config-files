" use vim settings instead of vi (must be first)
set nocompatible

" -----------------------------------------------------------------------------
" Vim-plug Configuration {{{
" -----------------------------------------------------------------------------

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'chriskempson/base16-vim'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'kien/ctrlp.vim'
Plug 'airblade/vim-gitgutter'
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-obsession'
Plug 'scrooloose/syntastic', { 'for': 'javascript' }
Plug 'mhinz/vim-startify'

call plug#end()

" }}}

" -----------------------------------------------------------------------------
" General {{{
" -----------------------------------------------------------------------------

" change map leader from \ to , and map \ to reverse search
let mapleader=","
noremap \ ,

" reload files when changed outside of vim
set autoread
autocmd FocusGained,BufEnter * :checktime

" allow backspace over anything in Insert mode
set backspace=indent,eol,start

" allow buffers to be put in the background without writing the file, and
" preserve undo-history, and marks when returning to buffer
set hidden

" bump up history limit from 20 to 1000
set history=1000

" enable extended `%` matching. note: runtime is the same as source except
" that it's relative to the vim installation directory
runtime macros/matchit.vim

" replace system bell with screen flash
set visualbell

" move backup, swap, and undo file directories to central location
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//

" yank, delete, change, and put to system clipboard
if has('unnamedplus')
  set clipboard^=unnamedplus
else
  set clipboard^=unnamed
endif

" }}}

" -----------------------------------------------------------------------------
" Colors and Fonts {{{
" -----------------------------------------------------------------------------

" turn syntax highlighting on
syntax enable

" access colors present in 256 colorspace
let base16colorspace=256

" set color scheme to dark solarized
set background=dark
colorscheme base16-solarized

" }}}

" -----------------------------------------------------------------------------
" Text and Spacing {{{
" -----------------------------------------------------------------------------

" number of visual spaces per TAB
set tabstop=2

" number of spaces in TAB when editing
set softtabstop=2

" number of spaces per TAB
set shiftwidth=2

" tabs are spaces
set expandtab

" copy indent from current line
set autoindent

" use multiples of shiftwidth when indenting with `<<` or `>>`
set shiftround

" remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" turn modelines on
set modelines=1

" number of vertical screen lines to show around cursor
set scrolloff=8

" number of horizontal screen lines to show around cursor
set sidescrolloff=15

" number of columns to scroll horizontally by
set sidescroll=1

" only wrap at characters in `breakat` option
set linebreak

" turn list off as it disables linebreak
set nolist

" string to put before wrapped screen lines
set showbreak=↪\ \

" }}}

" -----------------------------------------------------------------------------
" UI configuration {{{
" -----------------------------------------------------------------------------

" show line number relative to the cursor
set relativenumber

" show line current line number in front of the cursor
set number

" show command in bottom bar
set showcmd

" highlight current line
set cursorline

" load filetype-specific indent files
filetype plugin indent on

" redraw only when we need to (not during macros)
set lazyredraw

" faster redraws
set ttyfast

" highlight matching [{()}]
set showmatch

" adds 80 character vertical line
set colorcolumn=80

" always show vim-airline
set laststatus=2

" decrease timeout to update mode UI
set timeoutlen=1000
set ttimeoutlen=10

" remove default mode infavor of airline
set noshowmode

" visual autocomplete for command menu and behave line shell completion
set wildmenu
set wildmode=list:longest

" }}}

" -----------------------------------------------------------------------------
" Search {{{
" -----------------------------------------------------------------------------

" search as characters are entered
set incsearch

" highlight matches
set hlsearch

" ignore case when searching a file
set ignorecase

" override `ignorecase` when a upper case letter is entered
set smartcase

" }}}

" -----------------------------------------------------------------------------
" Folding {{{
" -----------------------------------------------------------------------------

" turn folding off by default
set nofoldenable

" fold any blocks nested 10 times
set foldlevelstart=10

" only fold up to 10 nested blocks
set foldnestmax=10

" }}}

" -----------------------------------------------------------------------------
" Key mappings {{{
" -----------------------------------------------------------------------------

" set C-l to clear out search highlighting
nnoremap <leader><space> :noh<CR><esc>

" shortcuts to cycle through buffers
nnoremap <leader><Tab> :bnext<CR>
nnoremap <leader><S-Tab> :bprevious<CR>

" shortcut to edit/reload vimrc
nmap <silent> <leader>ev :e $VIMRC<CR>
nmap <silent> <leader>sv :so $VIMRC<CR>

" shortcut to delete a buffer without closing the split
nnoremap <leader>d :bp\|bd #<CR>

" }}}

" -----------------------------------------------------------------------------
" CtrlP {{{
" -----------------------------------------------------------------------------

" ignore node_modules, and git directory
let g:ctrlp_custom_ignore='\v[\/](node_modules|\.git)$'

" show hidden files in CtrlP
let g:ctrlp_show_hidden=1

" }}}

" -----------------------------------------------------------------------------
" Airline {{{
" -----------------------------------------------------------------------------

" enable powerline fonts
let g:airline_powerline_fonts=1

" make the airline theme match the vim theme
let g:airline_theme='base16'

" enable tabline
let g:airline#extensions#tabline#enabled=1

" enable syntastic integration
let g:airline#extensions#syntastic#enabled=1

" disable powerline in favor of airline
let g:powerline_loaded=1

" }}}

" -----------------------------------------------------------------------------
" NERDTree {{{
" -----------------------------------------------------------------------------

let g:NERDTreeShowHidden=1

" }}}

" -----------------------------------------------------------------------------
" Syntastic {{{
" -----------------------------------------------------------------------------

" run linting on open
let g:syntastic_check_on_open=1

" dont run linting when quiting vim
let g:syntastic_check_on_wq=0

" run all checkers for a filetype instead of stopping at first that errors
let g:syntastic_aggregate_errors=0

" allows put errors in location-list
let g:syntastic_always_populate_loc_list=1

" auto open location-list on error and auto close when no errors are detected
let g:syntastic_auto_loc_list=1

" don't display "tooltip" errors
let g:syntastic_enable_balloons=0

" set syntastic to "active" mode
let g:syntastic_mode_map = { "mode": "active" }

" use eslint for JavaScript linting
let g:syntastic_javascript_checkers=['eslint']

" }}}

" -----------------------------------------------------------------------------
" Startify {{{
" -----------------------------------------------------------------------------

" remove header
let g:startify_custom_header=[]

" remove 80 character column on startify
autocmd User Startified setlocal colorcolumn=0

" }}}

" vim:foldmethod=marker:foldlevel=0
