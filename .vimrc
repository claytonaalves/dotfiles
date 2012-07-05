set nocompatible
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

syntax enable
"set background=dark
colorscheme oceandeep

let mapleader=","

set virtualedit=all              " allow the cursor to go in to "invalid" places
set expandtab                    " expand tabs by default (overloadable per file type later)
set tabstop=4                    " a tab is four spaces
set softtabstop=4                " when hitting <BS>, pretend like a tab is removed, even if spaces
set shiftwidth=4                 " number of spaces to use for autoindenting
set backspace=indent,eol,start   " allow backspacing over everything in insert mode
set nowrap                       " don't wrap lines
set hidden
set number                       " always show line numbers

set hlsearch
set incsearch
set ignorecase
set smartcase

set gdefault
set enc=utf-8                    " utf-8 default encoding
set fileformats=unix,dos,mac     " prefer unix over windows over os9 formats
set scrolloff=5                  " keep some more lines for scope
set autochdir
"set nobackup
"set noswapfile
"set backupdir=c:\tmp
"set directory=c:\tmp

set guioptions+=lrb
set guioptions-=lrb
set guioptions-=T
set guioptions-=m
set gfn=Monospace
set shortmess+=I

filetype plugin indent on
autocmd FileType python set complete+=k~/.vim/syntax/python.vim
autocmd FileType php set iskeyword+=$

nnoremap / /\v
vnoremap / /\v

map <F6> :NERDTreeToggle<CR>
map <C-Right> :bn<CR>
map <C-Left> :bp<CR>
imap <C-BS> <C-w>
map <S-Enter> O<Esc>j
nmap <CR> o<Esc>k

map <C-k> <C-Y>
map <C-j> <C-E>
map <C-h> zH
map <C-l> zL
"map <C-Down> <C-E>
"map <C-Up> <C-Y>

" quicker window switching
"nnoremap <C-h> <C-w>h
"nnoremap <C-l> <C-w>l

nnoremap <silent> <leader>q :q<CR>
nnoremap <silent> <leader>w :up<CR> :bd<CR>
nnoremap <silent> <leader>s :w<CR>

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
nmap <F5> :!python "%"<CR>
" Testes
"filetype plugin on
"let g:pydiction_location = 'C:\Program Files (x86)\Vim\vimfiles\ftplugin\pydiction\complete-dict'

" --------------------------------------
" Ativa fechamento automático para parêntese
" Set automatic expansion of parenthesis/brackets
"inoremap ( ()<esc>:call BC_AddChar(")")<cr>i
"inoremap { {}<esc>:call BC_AddChar("}")<cr>i
"inoremap [ []<esc>:call BC_AddChar("]")<cr>i
" inoremap " ""<esc>:call BC_AddChar(""")<cr>i
"
" mapeia CTRL+j para pular fora de parênteses colchetes etc...
"inoremap <C-j> <esc>:call search(BC_GetChar(), "W")<cr>a
" Function for the above
" function! BC_AddChar(schar)
"    if exists("b:robstack")
"        let b:robstack = b:robstack . a:schar
"    else
"        let b:robstack = a:schar
"    endif
" endfunction
" function! BC_GetChar()
"    let l:char = b:robstack[strlen(b:robstack)-1]
"    let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
"    return l:char
" endfunction

"set statusline=[%{&ff}/%Y]\ [ASCII=\%03.3b]-\ [%04l,%04v][%p%%]
"set laststatus=2

"FuzzyFinder
map ,f :FufFile<CR>
