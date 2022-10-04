" Install vim-plug if not exist-------------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin list----------------------------------------
call plug#begin('~/.vim/plugged')
" Code format
" Plug 'Chiel92/vim-autoformat'
" Folder tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" Vim-ariline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Bracket color
Plug 'luochen1990/rainbow'
" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Code folding
Plug 'tmhedberg/SimpylFold'
" Show white space
Plug 'ntpeters/vim-better-whitespace'
" Syntastic checking
Plug 'w0rp/ale'
" Color Scheme
Plug 'flazz/vim-colorschemes'
" Markdown previewer
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
" Tagbar
"Plug 'majutsushi/tagbar'
" vim-gutentags
" Plug 'ludovicchabant/vim-gutentags'

" Indent
Plug 'lukas-reineke/indent-blankline.nvim'

" vista
Plug 'liuchengxu/vista.vim'

" Auto pair
" rm -rf .vim/view
Plug 'jiangmiao/auto-pairs'
" Smooth motion
Plug 'yuttie/comfortable-motion.vim'
" Hihglight for search
Plug 'easymotion/vim-easymotion'
" Menubar from skywind
Plug 'skywind3000/vim-quickui'
" Table format
Plug 'vim-scripts/Align'
" HTML5
Plug 'mattn/emmet-vim'
" Customize icon
Plug 'ryanoasis/vim-devicons'
" Syntax for all
Plug 'sheerun/vim-polyglot'
" Vim clap
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary!' }
call plug#end()


" Basic setting------------------------------------------------
" Set tab equal to 4 space
set tabstop=2
set softtabstop=2
set shiftwidth=2
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

"set mouse=a

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" Enable local vimrc
set exrc
set secure

" File type alias
source $VIMRUNTIME/filetype.vim

" Language setting---------------------------------------------
" For cpp
autocmd FileType cpp set cindent

autocmd FileType python let $PYTHONUNBUFFERED=1
nnoremap <C-H> :cn <cr>
nnoremap <C-L> :cp <cr>


" Plugin setting--------------------------------------------------------------
" Plug 'luochen1990/rainbow'
let g:rainbow_conf = {
            \   'separately': { 'cmake': 0 }
            \}
let g:rainbow_active = 1


" Plug 'flazz/vim-colorschemes'
set t_Co=256
colorscheme molokai
set hlsearch
"highlight Normal ctermbg=None
" let g:CSApprox_attr_map = { 'bold' : 'bold', 'italic' : '', 'sp' : '' }
"highlight comment guifg=#928374 ctermfg=189 cterm=italic
"highlight SignColumn ctermbg=None
"highlight LineNr ctermfg=11
"highlight Folded cterm=bold ctermfg=DarkCyan ctermbg=None
"hi Function ctermfg=168 ctermbg=None cterm=bold


" Plug 'dense-analysis/ale'
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
let g:ale_echo_msg_format = '[#%linter%#] %s [%severity%]'
let g:ale_statusline_format = ['E•%d', 'W•%d', 'OK']
let g:ale_sign_error = '▶'
let g:ale_sign_warning = '▶'
let g:ale_echo_msg_error_str = '✹ Error'
let g:ale_echo_msg_warning_str = '⚠ Warning'
highlight GruvboxRedSign ctermfg=167 ctermbg=None guifg=#fb4934 guibg=#3c3836
highlight GruvboxYellowSign ctermfg=214 ctermbg=None guifg=#fabd2f guibg=#3c3836

let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:ale_linters_explicit=1
let g:airline#extensions#lae#enabled=1
let g:ale_c_parse_makefile=1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_python_pylint_options='--rffile=~/.pylintrc'
let g:ale_linters = {
            \   'python': ['flake8', 'pylint'],
            \   'javascript': ['eslint'],
            \   'cpp': ['cc', 'cppcheck'],
            \   'cuda': ['nvcc']}
    " C++ in ALE
let g:ale_c_cc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_cc_options = '-Wall -O2 -std=c++17'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''

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


" Plug 'tmhedberg/SimpylFold'
let g:SimpylFold_docstring_preview = 1
set foldmethod=indent
set foldlevel=99

" Plug 'easymotion/vim-easymotion'
hi EasyMotionTarget ctermbg=none ctermfg=208
hi EasyMotionShade ctermbg=none ctermfg=gray
hi EasymotionTarget2First ctermbg=none ctermfg=208
hi EasymotionTarget2Second ctermbg=none ctermfg=208


" Plug 'iamcco/markdown-preview.nvim'
" let g:mkdp_echo_preview_url = 1 to check if mkdp can work or not
let g:mkdp_auto_start=1


" Plug 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
let g:user_emmet_leader_key=','


" Plug 'skywind3000/vim-quickui'---------------------------------------------
call quickui#menu#reset()

"hi! link BGon 235
"hi! link BGoff None
"\ ['Highlight &Normal %{&color? "235":"None"}', 'highlight Normal ctermbg=']

" Plug 'scrooloose/nerdtree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Plug 'ludovicchabant/vim-gutentags'
" gutentags search upper recursively, stop if meet these files / folders
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" Ctags file name
let g:gutentags_ctags_tagfile = '.tags'

" vim nmap put all tag files into ~/.cache/tags
let s:vim_tags = expand('~/.cache/tags')
let g:gutentags_cache_dir = s:vim_tags

" Ctags ignore dirs
let g:gutentags_ctags_exclude = [ '*.git', 'bazel-*', 'build*', '*.pyc']

" Ctags argument
let g:gutentags_ctags_extra_args = []
let g:gutentags_ctags_extra_args += ['--fields=+niazS', '--extras=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
"let g:gutentags_generate_on_write = 0

" swap <c-]> and g<C-]>
nnoremap <c-]> g<c-]>
nnoremap g<c-]> <c-]>

" Create ~/.cache/tags if it not exists
if !isdirectory(s:vim_tags)
   silent! call mkdir(s:vim_tags, 'p')
endif

" Plug 'Chiel92/vim-autoformat'
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0

call quickui#menu#install('&Plugin', [
            \ ["&NERDTree", 'NERDTreeToggle', ''],
            \ ["&Vista", 'Vista', ''],
            \ ])

" enable to display tips in the cmdline
let g:quickui_show_tip = 1
let g:quickui_color_scheme = 'gruvbox'
" hit space twice to open menu
noremap <space><space> :call quickui#menu#open()<cr>

" Plug 'vim-scripts/Align'
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" " Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Plug 'liuchengxu/vim-clap'
let g:clap_theme = 'atom_dark'

" Plug 'coc'
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
