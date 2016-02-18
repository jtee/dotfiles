" use vundle instead of vim-pathogen
" https://github.com/gmarik/vundle
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-sensible'
set undodir^=~/.vim/undo
" set backupdir=~/.vim/backup
"Plugin 'tpope/vim-commentary'
"autocmd FileType ocaml set commentstring=(*\ %s\ *)
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rsi'
Plugin 'tpope/vim-sleuth'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-characterize'
Plugin 'tpope/vim-speeddating'
Plugin 'tpope/vim-jdaddy'

Plugin 'mhinz/vim-startify'
Plugin 'flazz/vim-colorschemes'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

set encoding=utf-8

Plugin 'airblade/vim-gitgutter'
set updatetime=750 " terminal vim might have highlighting glitches for low times...

Plugin 'terryma/vim-multiple-cursors'
Plugin 'godlygeek/tabular'
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
Plugin 'sjl/gundo.vim'

Plugin 'Lokaltog/vim-easymotion'
map <Leader> <Plug>(easymotion-prefix)
let g:EasyMotion_smartcase   = 1
let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>l <Plug>(easymotion-lineforward)

Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'IndexedSearch'
"Plugin 'majutsushi/tagbar'

Plugin 'Twinside/vim-hoogle'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-jade'
Plugin 'jcf/vim-latex'

Plugin 'idris-hackers/idris-vim'

Plugin 'derekwyatt/vim-scala'

call vundle#end()
filetype plugin indent on

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set background=dark
colorscheme solarized
call togglebg#map("<F5>")

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.ll set filetype=llvm
autocmd BufNewFile,BufReadPost *.td set filetype=tablegen

" OCaml
" setup merlin, syntastic and ocp-indent
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
"let g:syntastic_auto_jump = 2
let g:syntastic_ocaml_checkers = ['merlin']
nnoremap <leader>o :TypeOf<cr>
nnoremap <leader>l :Locate<cr>
execute 'autocmd FileType ocaml source' g:opamshare . "/vim/syntax/ocp-indent.vim"

" http://chneukirchen.org/dotfiles/.vimrc
" a selects everything in visual selection mode
"vmap a <esc>ggVG
" background, even in insert mode
map! <C-Z> <C-O>:stop<C-M>

" http://amix.dk/vim/vimrc.html
let mapleader = ","
let maplocalleader = ","
let g:mapleader = ","
" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr>

" toggle comment with C-/
nmap  <leader>ci
imap  <esc><leader>ci
vmap  <leader>ci " cs does multipart if available, but does not toggle :(

" https://github.com/nihathrael/configs/blob/master/.vimrc
set viminfo+=!          " support for yanking
set mouse=a             " enable mouse
set number              " show line numbers

" http://stevelosh.com/blog/2010/09/coming-home-to-vim/#why-i-came-back-to-vim
set cursorline
" FocusLost only works with gvim -> don't use relativenumber in terminal
" if has("gui-running")
"     set relativenumber
"     "http://jeffkreeftmeijer.com/2012/relative-line-numbers-in-vim-for-super-fast-movement/
"     "http://learnvimscriptthehardway.stevelosh.com/chapters/14.html
"     augroup relnum
"         autocmd!
"         autocmd FocusLost * :set norelativenumber
"         autocmd FocusGained * :set relativenumber
"         autocmd InsertEnter * :set norelativenumber
"         autocmd InsertLeave * :set relativenumber
"     augroup END
" endif

" http://choorucode.com/2014/01/24/how-to-enable-case-insensitive-filename-completion-in-vim/
set wildignorecase
set wildmode=list:longest,full
augroup AutoReloadVimRC
  au!
  au BufWritePost $MYVIMRC so $MYVIMRC " load new .vimrc on save (only adds :/)
augroup END

set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set linebreak
set nolist
set textwidth=0
set wrapmargin=0
set formatoptions+=l
set ts=4
set shiftwidth=4

" don't add newline at the end of files
" set binary
" set noeol

"set list
set listchars=tab:▸\ ,eol:¬

""""""""" Show superfluos spaces """""""""
:highlight ExtraWhitespace ctermbg=darkred guibg=darkred
:autocmd Syntax * syn match ExtraWhitespace /\s\+$\| \+\ze\t/ containedin=ALL

""""""""" ü = :shell """""""""""""""""""""
nmap ü :shell<cr>

""""""""" buffer magic """""""""""""""""""
" <M-k> doesn't work in gnome-terminal, but typing ctrl-v alt-k works
nnoremap k :bn!<cr>
nnoremap j :bp!<cr>
nnoremap d :bd!<cr>
set hidden " allows switching to another buffer with unsaved buffer open

""""""""" ó,ö = y/p with clipboard """""""""
" vmap ó "+y
" nmap ó viwó             " Y already used in normal mode
" map ö "+gP
set clipboard=unnamed " use the system clipboard per default (must be compiled with +clipboard, if not try gvim -v)

""""""""" gp = select pasted text """"""""
nnoremap gp `[v`]

set pastetoggle=<F12>

" tab navigation
" map <C-j> :tabprevious<CR>
" map <C-k> :tabnext<CR>
" imap <C-j> <Esc>:tabprevious<CR>i
" imap <C-k> <Esc>:tabnext<CR>i
" map <C-t> :tabnew<Space>
" imap <C-t> <Esc>:tabnew<Space>

"map <M-o> O<ESC>

" keep selection on indentation
vnoremap < <gv
vnoremap > >gv

set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"

" jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" CamelCase move
nnoremap <silent><C-Left> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
nnoremap <silent><C-Right> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
" nnoremap <silent><C-b> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
" nnoremap <silent><C-w> :<C-u>call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>
inoremap <silent><C-Left> <C-o>:call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%^','bW')<CR>
inoremap <silent><C-Right> <C-o>:call search('\<\<Bar>\U\@<=\u\<Bar>\u\ze\%(\U\&\>\@!\)\<Bar>\%$','W')<CR>

" insert lines and stay in normal mode
" nmap  O<Esc>
nmap <CR> o<Esc>

" this needs to be at the end since it's (re)set when compatible is (re)set
autocmd BufNewFile,BufRead * setlocal formatoptions-=o " disable comment continuation for o/O (use enter)
