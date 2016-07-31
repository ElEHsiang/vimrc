 if !1 | finish | endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
     filetype off
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif


 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 NeoBundle 'Valloric/YouCompleteMe'
 NeoBundle 'Lokaltog/vim-powerline'
 NeoBundle 'vim-scripts/Tagbar'
 NeoBundle 'tmhedberg/SimpylFold'
 NeoBundle 'Raimondi/delimitMate'
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'scrooloose/syntastic'
 NeoBundle 'flazz/vim-colorschemes'


 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

set encoding=utf-8

syntax on " 使用语法高亮
set autoread " 正在编辑文件被其他程序改动时自动重新加载
set nocp " 使用不兼容 vi 的模式
set autoindent " 设置自动对齐(缩进)
set smartindent " 智能对齐方式
set wrap " 自动换行
set linebreak " 整词换行
set cindent " 使用 C/C++ 语言的自动缩进方式
set backspace=2 " 设置退格键可用
set mouse=a " 使用鼠标
set number " 显示行号
set cul " 显示当前行下划线
set shiftwidth=4
"set tabstop=8 " 设置制表符(tab键)的宽度
set tabstop=4 " 设置制表符(tab键)的宽度
"set softtabstop=8 " 设置软制表符的宽度
set softtabstop=4 " 设置软制表符的宽度
set expandtab " Tab替换空格
scriptencoding utf-8 " 设置编码
set cursorline " 高亮当前行
set ic "case insensitive
set smartcase
set clipboard+=unnamedplus
map <C-y> "+y
map <C-p> "+p

set background=dark


highlight clear SignColumn
highlight clear LineNr

"YCM setting
let g:ycm_global_ycm_extra_conf="~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <F7> :YcmForceCompileAndDiagnostics<CR>
let g:ycm_confirm_extra_conf = 0
let g:syntastic_always_populate_loc_list = 1
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_register_as_syntastic_checker=0
let g:ycm_show_diagnostics_ui = 0
set tags=tags
set tags+=./tags

"Powerline
set nocompatible
set laststatus=2
set encoding=utf-8
set t_Co=256
set guifont=PowerlineSymbols\ for\ Powerline
let g:Powerline_symbols='unicode'

"Syntastic
let g:statline_syntastic = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"
cnoremap Q! q!
cnoremap Q1 q!
command Q q
command Wq wq
command WQ wq
command W w

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :Tagbar<CR>
nnoremap <F5> :make<CR>
