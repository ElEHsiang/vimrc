" Install vim-plug if not exist-------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin list----------------------------------------
call plug#begin('~/.vim/plugged')
" Folder tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Vim-ariline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Bracket color
Plug 'luochen1990/rainbow'
" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Color Scheme
Plug 'flazz/vim-colorschemes'
" Markdown previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" vista
Plug 'liuchengxu/vista.vim'
" Auto pair
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Basic setting------------------------------------------------
syntax on

" Set tab equal to 4 space
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent
set expandtab

" Highlight the curson column and line
" set cursorcolumn
set cursorline

" Some else
set number
set background=dark
set clipboard=unnamed
set encoding=utf-8

" Add (command line like) wild menu to vim
set wildmenu
set wildmode=list:longest,full
"highlight clear SignColumn

set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set tags=./.tags;,.tags

command W w
command Q q
command Wq wq
command WQ wq

set mouse=a

if has("autocmd")
  filetype plugin indent on
endif

" Enable local vimrc
set exrc
set secure

" wrap text or markdown
au FileType markdown set wrap
au FileType text set wrap

" File type alias
source $VIMRUNTIME/filetype.vim

" Language setting---------------------------------------------
" For cpp
autocmd FileType cpp set cindent

autocmd FileType python let $PYTHONUNBUFFERED=1
nnoremap <C-H> :cn <cr>
nnoremap <C-L> :cp <cr>

" Plug 'flazz/vim-colorschemes'
set t_Co=256
colorscheme molokai
set hlsearch

" Plugin setting--------------------------------------------------------------
" Plug 'luochen1990/rainbow'
let g:rainbow_conf = {
            \   'separately': { 'cmake': 0 }
            \}
let g:rainbow_active = 1

" Plug 'vim-airline/vim-airline'
let g:airline_theme='fruit_punch'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = '|'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline#extensions#tabline#formatter = 'default'

" Plug 'scrooloose/nerdtree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" vim nmap put all tag files into ~/.cache/tags
let s:vim_tags = expand('~/.cache/tags')

" swap <c-]> and g<C-]>
nnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>

" Plug 'coc'
set updatetime=300
set signcolumn=yes
set tagfunc=CocTagFunc

" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)
