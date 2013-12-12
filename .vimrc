syntax enable
filetype plugin indent on

set number
set tw=99
set bg=dark
set nowrap
set fo-=t
set colorcolumn=100
set t_Co=256
colorscheme solarized



set encoding=utf8
set ffs=unix,dos,mac

set expandtab
set smarttab

set shiftwidth=4
set tabstop=4

set ai
set si
let mapleader = ","

" Removes highlight of your last search
noremap <C-n> :nohl<CR>
vnoremap <C-n> :nohl<CR>
inoremap <C-n> :nohl<CR>


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

" Disable backup
set nobackup
set nowritebackup
set noswapfile

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

let g:syntastic_python_checker_args='--ignore=E501'
let g:syntastic_python_flake8_args='--ignore=E501'
let g:syntastic_python_pylint_args='--ignore=E501'
