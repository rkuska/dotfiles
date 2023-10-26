call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lifepillar/vim-solarized8'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdcommenter'
Plug 'mkitt/tabline.vim'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-fugitive'
Plug 'rust-lang/rust.vim'
Plug 'mbbill/undotree'

call plug#end()

syntax enable
filetype plugin indent on

set relativenumber
set number
set tw=99
set bg=dark
set nowrap
set colorcolumn=120
set display+=lastline
set encoding=utf8
set ffs=unix,dos,mac
" fold on indent
set fdm=indent
" always expand all folds on start
set nofoldenable
set backspace=indent,eol,start
set termguicolors
colorscheme solarized8
" highlight previous search pattern
set hlsearch
" expand tab to spaces
set expandtab
" indent shift matches to 4 spaces
set shiftwidth=4
" tab matches to 4 spaces
set tabstop=4
" infinite undo
set undofile
" use autoindent for copying current line's indent
set ai
" use smartindent to also be more smart about indents
set si

let g:mapleader="\<Space>"

" sort selected lines alphabetically
vnoremap <Leader>s :sort<CR>
"
" shift indent left
vnoremap < <gv
" shift indent right
vnoremap > >gv

" navigate like a sane person
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" mappings for buffers, I try to mimic browser shortcuts
nmap <leader>i :set list!<CR>
nmap <leader>t :enew<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>
nmap <leader>w :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>
nmap <leader>q :q<CR>

" clear highlighting
nmap <leader>/ :nohl<CR>

" delete trailing whitespace
nnoremap <leader>rtw :%s/\s\+$//e<CR>
" show trailing whitespace
highlight Trail ctermbg=red guibg=red
call matchadd('Trail', '\s\+$', 100)
"
" Let Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

let target_path = expand('~/.undodir')

" create the directory and any parent directories
" if the location does not exist.
if !isdirectory(target_path)
    call mkdir(target_path, "p", 0700)
endif

let &undodir=target_path
set undofile
nnoremap <Leader>z :UndotreeToggle<CR>

"
"
" PLUGIN SETTINGS
"
"
" fzf vim commands mappings
nmap <C-P> :GFiles<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>c :Commits<CR>
nmap <Leader>bc :BCommits<CR>
nmap <Leader>f :Ag<CR>
nmap <Leader>b :Buffers<CR>

" coc settings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <silent> <C-k> <Plug>(coc-diagnostic-prev)
nmap <silent> <C-j> <Plug>(coc-diagnostic-next)

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gc <Plug>(coc-rename)



autocmd FileType go nmap <silent> gt :CocCommand go.gopls.tidy<cr>

nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
autocmd BufWritePre *.go,*.rs :silent call CocAction('format')


" airline settings
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#tab_nr_type = 2
let g:airline#extensions#coc#enabled = 1
let g:airline_theme='solarized'
let g:airline_solarized_bg='dark'
"
