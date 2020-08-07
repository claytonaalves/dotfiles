set nocompatible              " be iMproved

call plug#begin('~/.vim/plugged')

Plug 'godlygeek/tabular'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'rakr/vim-one'
Plug 'NLKNguyen/papercolor-theme'
Plug 'blueshirts/darcula'
Plug 'vim-vdebug/vdebug'

call plug#end()

filetype off
filetype plugin indent on

" My custom shit...
syntax on

let mapleader=","

set virtualedit=all
set expandtab                    " expand tabs by default (overloadable per file type later)
set tabstop=4                    " a tab is four spaces
set softtabstop=4                " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4                 " number of spaces to use for autoindenting
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set nowrap
set hidden
set number

set clipboard=unnamed "unnamedplus

set wildignore+=*.so,*.swp,*.zip,*.class,*.apk,*.pyc,*/venv

set hlsearch
set incsearch
set ignorecase
set smartcase

"set laststatus=2 "show filename in status

nnoremap <c-k> <C-Y>
nnoremap <c-j> <C-E>

map <c-l> :bnext<CR>
map <c-h> :bprevious<CR>

nnoremap <silent> <leader>w :w<CR>
nnoremap <silent> <leader>c :bd<CR>

"nmap <PageUp> :tabprevious<CR>
"nmap <PageDown> :tabnext<CR>

" Automatic parenthesis/brackets expansion {
inoremap ( ()<esc>:call BC_AddChar(")")<cr>i
inoremap { {}<esc>:call BC_AddChar("}")<cr>i
inoremap [ []<esc>:call BC_AddChar("]")<cr>i
inoremap " ""<esc>:call BC_AddChar(""")<cr>i

function! BC_AddChar(schar)
   if exists("b:robstack")
       let b:robstack = b:robstack . a:schar
   else
       let b:robstack = a:schar
   endif
endfunction
" Automatic parenthesis/brackets expansion }

let g:ctrlp_custom_ignore = 'vendor\|common/tests/cache\|common/tests/_data\|console/migrations\|backend/web/fonts'

set fillchars+=vert:\│
autocmd ColorScheme * highlight VertSplit cterm=NONE ctermfg=Green ctermbg=NONE

" Netrw config
let g:netrw_banner = 0
let g:netrw_browse_split = 4
let g:netrw_winsize = 20

"colorscheme darcula
colorscheme PaperColor
set background=dark

"XML formatting
au FileType xml setlocal formatexpr=
au FileType xml setlocal formatprg=xmllint\ --format\ -
au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null

"Remove trailing spaces on save
autocmd FileType c,cpp,java,php,python autocmd BufWritePre <buffer> %s/\s\+$//e

autocmd BufRead,BufNewFile *.pp set ft=pascal
"autocmd BufRead,BufNewFile *.janet set ft=lisp

"PHP shit
autocmd FileType php set iskeyword+=$

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" Create Ag command
command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
nnoremap \ :Ag<SPACE>

" Vdebug
if !exists('g:vdebug_options')
  let g:vdebug_options = {}
endif
let g:vdebug_options.path_maps = {"/srv/www/elloweb": "/home/clayton/dev/aragorn"}
let g:vdebug_options.break_on_open = 0
let g:vdebug_keymap = {
\    "run" : "<F9>",
\    "run_to_cursor" : "<F4>",
\    "step_over" : "<F8>",
\    "step_into" : "<F7>",
\    "step_out" : "<S-F8>",
\    "close" : "<C-F6>",
\    "detach" : "<C-F7>",
\    "set_breakpoint" : "<F5>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e",
\}

