" by titan 

" 功能函数 {{{
function! GetSys()          " 获取操作系统
    if has("win16") || has("win32") || has("win64") || has("win95")
        return "windows"
    elseif has("unix")
        return "linux"
    endif
endfunction

function! IsGui()           " 是否GUI
    if has("gui_running")
        return "true"
    else
        return "false"
    endif
endfunction

function! PhpRun()          " 执行PHP
    setlocal makeprg=php\ -d\ html_errors=off
    setlocal shellpipe=>
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    make %
endfunction

function! PhpSyntax()       " PHP语法检查
    setlocal makeprg=php\ -l\ -n\ -d\ html_errors=off
    setlocal shellpipe=>
    setlocal errorformat=%m\ in\ %f\ on\ line\ %l
    make %
endfunction

function! UpdateCtags()                 " 更新ctags
    let curdir=getcwd()
    while !filereadable("./tags")
        cd ..
        if getcwd() == "/"
            break
        endif
    endwhile
    if filewritable("./tags")
        !ctags -R *
    endif
    execute ":cd ". curdir
endfunction
" }}}

" vundle插件 {{{
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
set nocompatible              " be iMproved
filetype on                  " required!

if GetSys() == "windows"
    let g:my_vimrc = $HOME.'\vimfiles\vimrc'
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')  
else
    let g:my_vimrc = '~/.vimrc'
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif
"runtime pathogen/vim-pathogen/autoload/pathogen.vim
"execute pathogen#infect('pathogen/{}')

Bundle 'gmarik/vundle'
Bundle 'L9'
Bundle 'Lokaltog/vim-powerline'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'Auto-Pairs'
Bundle 'Yggdroot/indentLine'
Bundle 'winmanager'
Bundle 'fholgado/minibufexpl.vim'
Bundle "tComment"
Bundle 'PDV--phpDocumentor-for-Vim'
Bundle "Mark--Karkat"
Bundle 'Lokaltog/vim-easymotion'
Bundle 'terryma/vim-multiple-cursors'
"Bundle 'SuperTab'
Bundle 'matrix.vim--Yang'
Bundle 'Townk/vim-autoclose'
Bundle 'Align'

Bundle 'altercation/vim-colors-solarized'
Bundle 'hickop'

Bundle 'Tabular'
Bundle 'shawncplus/phpcomplete.vim'
"Bundle 'taglist.vim'
Bundle 'The-NERD-tree'  
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle "scrooloose/nerdcommenter"

Bundle 'Valloric/YouCompleteMe'
Bundle "SirVer/ultisnips"
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle "honza/vim-snippets"
Bundle 'scrooloose/syntastic'

Bundle 'hdima/python-syntax'
Bundle 'davidhalter/jedi-vim'
Bundle "python_fold_compact"
"Bundle "Pydiction" 
Bundle "kevinw/pyflakes-vim"
Bundle "thinca/vim-quickrun"

Bundle "nono/jquery.vim"
Bundle 'mattn/emmet-vim'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'pangloss/vim-javascript'

Bundle 'plasticboy/vim-markdown'

"quick run
let g:quickrun_no_default_key_mappings=1
let g:quickrun_config = { 
\   "_" : { 
\       "outputter" : "message",
\   },  
\}
let g:quickrun_no_default_key_mappings = 1 
nmap <Leader>r <Plug>(quickrun)
map <F10> :QuickRun<CR>

"jedi 

"syntastic 配置
let g:syntastic_error_symbol='>>'
let g:syntasitc_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_hightlighting=1

let g:syntastic_python_checkers=['pyflakes','pep8']
let g:syntastic_python_pep8_args='--ingnore=E501, E225, E124, E712'

"YouCompleteMe
"Ctrl+I 和Ctrl+O 后跳和前跳
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_complete_in_comments=1 "在注释中输入也能补全
let g:ycm_complete_in_strings=1  "在字符串中输入也能补全
let g:ycm_use_ultisnips_completer=1 "提示ULtiSnips
let g:ycm_seed_identifiers_from_tags_filtes=1


" 黑名单,不启用
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'gitcommit' : 1,
      \}

"UltiSnips
let g:UltiSnipsExpandTrigger="<C-tab>"
let g:UltiSnipsJumpForwardTrigger="<C-b>"
let g:UltiSnipsJumpBackwardTrigger="<C-z>"

"增强状态栏 Lokaltog/vim-powerline
let g:Powerline_symbols='fancy'
let g:Powerline_colorscheme='solarized256'
set t_Co=256
set laststatus=2

"emmet Ctrl-y + ,

"括号高亮 kien/rainbow_parentheses.vim
let g:rbpt_colorpairs = [
    \ [ 'brown' , 'RoyalBlue3'] ,
    \ [ 'Darkblue' , 'SeaGreen3'] ,
    \ [ 'darkgray' , 'DarkOrchid3'] ,
    \ [ 'darkgreen' , 'firebrick3'] ,
    \ [ 'darkcyan' , 'RoyalBlue3'] ,
    \ [ 'darkred' , 'SeaGreen3'] ,
    \ [ 'darkmagenta' , 'DarkOrchid3'] ,
    \ [ 'brown' , 'firebrick3'] ,
    \ [ 'gray' , 'RoyalBlue3'] ,
    \ [ 'black' , 'SeaGreen3'] ,
    \ [ 'darkmagenta' , 'DarkOrchid3'] ,
    \ [ 'Darkblue' , 'firebrick3'] ,
    \ [ 'darkgreen' , 'RoyalBlue3'] ,
    \ [ 'darkcyan' , 'SeaGreen3'] ,
    \ [ 'darkred' , 'DarkOrchid3'] ,
    \ [ 'red' , 'firebrick3'] ,
    \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces
nmap <F10 > :RainbowParenthesesToggle <CR >

"对齐线 Yggdroot/indentLine vim7.3以上 

"多文档编辑
let g:miniBufExplMapWindowNavVim=1 
let g:miniBufExplMapWindowNavArrows=1
let g:miniBufExplMapCTabSwitchBufs=1
let g:miniBufExplModSelTarget=1

let g:miniBufExplForceSyntaxEnable=1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplCycleArround=1
map <S-L> :MBEbn<CR>
map <S-H> :MBEbp<CR>

"WinManager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>

" tcomment
nnoremap // :TComment<CR>
vnoremap // :TComment<CR>

" PHP 函数，类注释 PDV--phpDocumentor-for-Vim
" inoremap <C-c> <ESC>:call PhpDocSingle()<CR>i 
" nnoremap <C-c> :call PhpDocSingle()<CR> 
" vnoremap <C-c> :call PhpDocRange()<CR>

" 高亮多个单词 Mark--Karkat

"快速移动 vim-easymotion
let g:EasyMotion_leader_key = 'f'

"多光标操作
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"文件对齐
map <leader>l :Align

"代码对齐 tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

"tagbar
let g:tagbar_autofocus=1
nmap <F4> :TagbarToggle<CR>

" 函数，变量列表
let Tlist_Ctags_Cmd = 'ctags'
let Tlist_Show_One_File = 1             " 是否仅仅显示一个文件的tag
let Tlist_Enable_Fold_Column = 0
let Tlist_Compact_Format = 1
"let Tlist_Auto_Open = 1
"let Tlist_WinWidth = 20
let Tlist_File_Fold_Auto_Close = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Exit_OnlyWindow = 1           " 当TList为最一个窗口时关闭
let Tlist_Close_On_Select = 1           " 当单击tag为自动关闭
"nnoremap <F4> :TlistToggle<CR>                                 " F4开启/关闭tagbar 需要下载ctags放入PATH目录

" 文件浏览
nnoremap <F3> :NERDTreeToggle<CR>                                     " F3开启/关闭NERDTree

" nerdtree-tabs
let g:nerdtree_tabs_open_on_console_startup=1

" 着色
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="normal" 
let g:solarized_visibility="normal"
set background=dark
colorscheme solarized
"colorscheme hickop


"python
let python_highlight_all=1
"let g:pydiction_location = '~/.vim/bundle/Pydiction/complete-dict'


filetype plugin indent on     " required!
" }}}

" 基础配置 {{{
autocmd! bufWritePost .vimrc source %  " 自动加载配置文件
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set termencoding=utf-8
set noswapfile

au FileType php setlocal dict+=~/.vim/dict/php_funclist.dict
au FileType css setlocal dict+=~/.vim/dict/css.dict
au FileType c setlocal dict+=~/.vim/dict/c.dict
au FileType cpp setlocal dict+=~/.vim/dict/cpp.dict
au FileType scale setlocal dict+=~/.vim/dict/scale.dict
au FileType javascript setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/javascript.dict
au FileType html setlocal dict+=~/.vim/dict/css.dict

syntax enable
syntax on              " 高亮
set hidden             "
set smartcase          " 搜索时智能大小写
set nobomb             " 无BOM头
set showcmd            " 在状态栏显示正在输入的命令
set hlsearch           " 搜索结果高亮
set guifont=Monaco:h10:w7
let mapleader=','
autocmd InsertLeave * se nocul " 用浅色高亮当前行
autocmd InsertEnter * se cul
set tabstop=4                   " 制表符为4
set softtabstop=4               " 统一缩进为4
set shiftwidth=4
set clipboard+=unnamed      " 共享剪切板 
set smartindent             " 继承前一行的缩进方式
set cindent                      " 使用C样式的缩进
set cinoptions=:s,ps,ts,cs
set cinwords=if,else,while,do,for,switch,case
set helplang=cn
set expandtab                   " 使用空格替换制表符
set scrolloff=3                 " 光标移动到buffer的顶部和底部时保持3行距离
set number                      " 行号
set modeline                    " 启用Modeline,详见http://vim.wikia.com/wiki/Modeline_magic
set nowrap                      " 显示不换行
set textwidth=0               " 输入模式下每
set backspace=2                 " 设置回格键正常处理

set wildmode=longest,list " At command line, complete longest common string, then list alternatives.

"set mouse=a "打开鼠标
"退出vim后，内容显示在终端屏幕，可以用来查看和复制
set t_ti= t_te=

" set cursorcolumn  " Highlight the current column
set cursorline    " Highlight the current line

set nofoldenable                          " 开启代码折叠
set foldmethod=marker                   " 折叠方式
set foldlevel=100                                   " Don't autofold anything (but I can still fold manually)
set foldopen=block,hor,mark,percent,quickfix,tag    " what movements open folds
set viminfo='10,\"100,:20,%,n~/.viminfo                 " 恢复上次文件打开位置
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm'\"")|else|exe "norm $"|endif|endif

set autochdir
set tags=tags;

"tab 操作
map <leader>th :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tj :tabnext<cr>             
map <leader>tk :tabprev<cr>                         
map <leader>tn :tabnext<cr>
map <leader>tp :tabprev<cr>
map <leader>te :tabedit<cr>
map <leader>td :tabclose<cr>
map <leader>tm :tabm<cr>
nnoremap <C-t>     :tabnew<CR>                                                                                                                                                                                
inoremap <C-t>     <Esc>:tabnew<CR>

set fo+=o " Automatically insert the current comment leader after hitting 'o' or 'O' in Normal mode.
set fo-=r " Do not automatically insert a comment leader after an enter
set fo-=t " Do no auto-wrap text using textwidth (does not apply to comments)

" 自动补全配置
"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
set completeopt=longest,menu

" 增强模式中的命令行自动完成操作
set wildmenu
" Ignore compiled files
set wildignore=*.o,*~,*.pyc,*.class

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
"

" Omnifunc 自动完成提示
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Django
au FileType html set ft=htmldjango.html
" }}}


nnoremap <C-h> <C-w>h                                       " 窗口分割时,快速切换
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <F2> :set nonumber!<CR>:set foldcolumn=0<CR>       " F2开启/关闭行号显示
nnoremap <F7> :set mouse=a<CR>       " F7开启鼠标
nnoremap <silent> <leader>cl :nohlsearch<CR>                " 快速清除高度搜索

" php
autocmd FileType php
            \ map <F5> :!php -f %<CR>|
            \ map <F6> :call PhpSyntax()<CR>

nmap <C-F5> :call UpdateCtags()<CR>                         " 更新ctags


nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
"kj 替换 Esc
inoremap kj <Esc>



" 保存python文件时删除多余空格
fun! <SID>StripTrailingWhitespaces()
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    call cursor(l, c)
endfun
autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()


" 定义函数AutoSetFileHead，自动插入文件头
autocmd BufNewFile *.sh,*.py exec ":call AutoSetFileHead()"
function! AutoSetFileHead()
    "如果文件类型为.sh文件
    if &filetype == 'sh'
        call setline(1, "\#!/bin/bash")
    endif

    "如果文件类型为python
    if &filetype == 'python'
        call setline(1, "\#!/usr/bin/env python")
        call append(1, "\# encoding: utf-8")
    endif

    normal G
    normal o
    normal o
endfunc


" }}}

"平台相关配置 {{{
" GUI {{{
if IsGui() == "true"
    set guioptions-=T                                       " 隐藏工具栏
    set guioptions-=m                                       " 隐藏菜单栏
    set guioptions-=L                                       " 隐藏左侧滚动条
    set guioptions-=r                                       " 隐藏右侧滚动条
    set guioptions-=b                                       " 隐藏底部滚动条
    set showtabline=0                                       " 隐藏Tab栏
    " set background=dark                                     " 为深色背景调整配色

    set langmenu=zh_cn.utf-8                                " 解决gbk时消息乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_cn.utf-8
endif
" }}}
" Windwos {{{
if GetSys() == "windows"
    set guifont=Consolas:h11                                " 字体
    autocmd GUIEnter * simalt ~x                            " 启动时窗口最大化
endif
" }}}
" }}}

" vim600: sw=4 ts=4 fdm=marker syn=vim

