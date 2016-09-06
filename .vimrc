syntax enable
filetype plugin indent on

set relativenumber
set number "this with comb ^ will show only current lineno
set tw=99
set bg=dark
set nowrap
set fo-=t
set colorcolumn=100
set t_Co=256
colorscheme lapis256
set display+=lastline
set encoding=utf8
set ffs=unix,dos,mac
set fdm=indent
set nofoldenable
set backspace=indent,eol,start

set smarttab
set hlsearch

set expandtab
set shiftwidth=4
set tabstop=4

" Enable per project .vimrc file
set exrc
set secure

set ai
set si
let mapleader = "\<Space>"
" set paste to f2 (when inserting code)
set pastetoggle=<F2>

" Force saving files that require root permission
cmap w!! w %!sudo tee > /dev/null %
" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" Quick quit command
 noremap <Leader>e :quit<CR> " Current window
 noremap <Leader>E :qa!<CR>  " Quit all windows

" Map sort function
vnoremap <Leader>s :sort<CR>

" Indent
vnoremap < <gv
vnoremap > >gv


" Pathogen
execute pathogen#infect()

" Powerline
set rtp+=/home/rkuska/.vim/bundle/powerline/powerline/bindings/vim
set laststatus=2

" Ctrlp
let g:ctrlp_max_height = 30

" NerdTree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" Statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

map <Leader>c :SyntasticCheck<CR>
map <Leader>x :SyntasticReset<CR>

let g:syntastic_python_checker_args='--ignore=E501'
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_python_pylint_args='--disable=R,C'
let g:syntastic_python_python_exec = '/usr/bin/env python'
let g:syntastic_python_checkers = ['pyflakes']
" Disable powerline because of vim-airline
let g:pathogen_disabled = ['powerline']
" Let airline use powerline fonts
let g:airline_powerline_fonts = 1
" Show buffers when only one tab is opened
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tabline#tab_nr_type = 2 " splits and tab number
let g:airline_theme='luna'



" Autoformat
noremap <F3> :Autoformat<CR>

hi Normal ctermbg=none
highlight NonText ctermbg=none


" navigate as sane person
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" speed up ctrl-p
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" whitespace
match ErrorMsg '\s\+$'
nnoremap <Leader>rtw :%s/\s\+$//e<CR>


" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 10
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction

" This allows buffers to be hidden if you've modified a buffer.
set hidden

" To open a new empty buffer
nmap <leader>t :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
nmap <leader>w :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

noremap <leader>/ :nohl<CR>

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

nmap <Leader>k :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" some golang fixes for synstastic
let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" auto close getdoc window
autocmd CompleteDone * pclose
set omnifunc=syntaxcomplete#Complete

