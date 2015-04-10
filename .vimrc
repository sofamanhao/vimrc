"configuration file for vim
set modelines=0		" CVE-2007-2438

set nocompatible	" Use Vim defaults instead of 100% vi compatibility

set backspace=2		" more powerful backspacing

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup nobackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup nobackup

" highlight 
syntax on

colorscheme desert
set t_Co=256

set encoding=utf-8
set lbr
set noeb

" line number
set nu!

#hi LineNr ctermfg=214
set cursorline
hi CursorLine   cterm=NONE ctermbg=237 ctermfg=NONE guibg=NONE guifg=NONE
set cursorcolumn
hi CursorColumn cterm=NONE ctermbg=237 ctermfg=none  guibg=NONE guifg=NONE

"tab distance 
set tabstop=4
" auto tab
set autoindent

set so=8 

"statusLine setting
set laststatus=2
set statusline=%<%f\   " 文件名
set statusline+=\ [%{&ff}/%Y]            " filetype
set statusline+=\ [%{getcwd()}]          " current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%\ %L  " Right aligned file nav info
hi StatusLine ctermfg=44 ctermbg=black
au InsertEnter * hi StatusLine ctermfg=yellow ctermbg=black
au InsertLeave * hi StatusLine ctermfg=44 ctermbg=black
set showcmd
"statusLine setting end

" Bundle Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..
"the fillowing is for the bundles
" 插件
filetype off 		" Required 
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
" my bundle here
" orginal repos on github 如果你的插件来自github，写在下方，只要作者名/项目名就行了
Bundle 'scrooloose/nerdtree'
Bundle 'pydoc.vim'

" bundle from vim-sscripts repos //如果插件来自 vim-scripts，你直接写插件名就行了
Bundle 'taglist.vim'


" non github repos 使用自己的git库的插件，像下面这样做
"Bundle 'git://git.wincent.com/command-t.git'
"'' git repos on your local machine (ie. when working on your own plugin)
"Bundle 'file:///Users/gmarik/path/to/plugin'
filetype plugin indent on     " required!
"插件
"bundle end

" 在 vim 启动的时候默认开启 NERDTree（autocmd 可以缩写为 au）
autocmd VimEnter * NERDTree
" 按下 F2 调出/隐藏 NERDTree
" map  :silent! NERDTreeToggle
" " 将 NERDTree 的窗口设置在 vim 窗口的右侧（默认为左侧）
" let NERDTreeWinPos="right"
" 当打开 NERDTree 窗口时，自动显示 Bookmarks
let NERDTreeShowBookmarks=1
"关闭vim时，如果打开的文件除了NERDTree没有其他文件时，它自动关闭，减少多次按:q!
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif

"taglist 设置
" 将 taglist 的窗口设置在 vim 窗口的右侧
let Tlist_Use_Right_Window = 1
"
"let Tlist_Exit_OnlyWindow = 1
"
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Auto_Open = 1
let Tlist_Show_Menu = 1

"折叠代码
"set foldmethod=indent
"set foldmethod=syntax
