"---------------------------------------------------------------
" Initialize vundlle
" git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"---------------------------------------------------------------

set nocompatible              " be iMproved, required
filetype off                  " required

"---------------------------------------------------------------
" Set the runtime path to include Vundle and initialize
"---------------------------------------------------------------
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'git://github.com/scrooloose/nerdtree.git'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Valloric/YouCompleteMe'                                  " 补充语言支持的安装 ./install.py --clang-completer  --go-completer
Plugin 'Yggdroot/LeaderF'
Plugin 'tpope/vim-surround'
Plugin 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'flazz/vim-colorschemes'
Plugin 'Xuyuanp/nerdtree-git-plugin' 
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"---------------------------------------------------------------
" Vundle initialize complete
"---------------------------------------------------------------

"---------------------------------------------------------------
" Default setting
"---------------------------------------------------------------

" 设置外观 -------------------------------------
"set number                             " 显示行号 
if has("gui_running")
    "set showtabline = 0                 " 隐藏顶部标签栏"
    set guioptions+=c                   " 使用字符提示框
    set guioptions-=r                   " 隐藏右侧滚动条" 
    set guioptions-=L                   " 隐藏左侧滚动条"
    set guioptions-=b                   " 隐藏底部滚动条"
    set guioptions-=T                   " 隐藏工具栏
    set guioptions-=m                   " 隐藏菜单栏
    set langmenu=zh_CN.UTF-8            " 显示中文菜单
    set transparency=12                 " 设置窗口透明度
    "set guifont=Monaco:h16
    set guifont=MesloLGSDZForPowerline-Regular:h16
    colorscheme wombat
    "colorscheme solarized
else
    colorscheme molokai               
endif
set cursorline                          " 突出显示当前行"
set cursorcolumn                        " 突出显示当前列"
set laststatus=2                        " 必须设置为2,否则状态栏不显示
set t_Co=256                            " 开启256颜色之后，colorschema在vim里好看了许多



" 变成辅助 -------------------------------------
set fileformat=unix                     " 设置以unix的格式保存文件
set incsearch                           " 输入搜索内容时就显示搜索结果
set hlsearch                            " 搜索时高亮显示被找到的文本
set noerrorbells                        " 关闭错误信息响铃
set novisualbell                        " 关闭使用可视响铃代替呼叫
set shiftwidth=4                        " 设定 << 和 >> 命令移动时的宽度为 4
set softtabstop=4                       " 使得按退格键时可以一次删掉 4 个空格
set showmatch                           " 显示匹配的括号
set scrolloff=3                         " 距离顶部和底部3行

" 其他杂项 -------------------------------------
"set mouse=a                             "启用鼠标"
"set selection=exclusive                 " 选择模式，排除第一个字符
set selectmode=key,mouse
set matchtime=5
set ignorecase                          "忽略大小写
set incsearch
set hlsearch                            "高亮搜索项
set noexpandtab                         "不允许扩展table
set whichwrap+=<,>,h,l
set autoread
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set langmenu=zh_CN.UTF-8

" Tomorrow系列
"colorscheme Tomorrow                   " 白色背景
"colorscheme Tomorrow-Night             " 黑色背景,序号看不清
"colorscheme Tomorrow-Night-Bright      " 黑色背景,高对比度，最清晰
"colorscheme Tomorrow-Night-Eighties    " 黑色背景,低对比度

" 其他
"colorscheme desert
"colorscheme molokai
"colorscheme pablo
"colorscheme phd
"colorscheme pablo
"colorscheme slate

let g:go_version_warning = 0                     " 忽略ycm对于vim的7.4的版本要求
"autocmd BufWritePost $MYVIMRC source $MYVIMRC    " 让配置变更立即生效

" 键映射 -------------------------------------
let mapleader=";"
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>m :nohlsearch<CR>
nmap 11 1gt
nmap 22 2gt
nmap 33 3gt
nmap 44 4gt
nmap 55 5gt
nmap 66 6gt
nmap 77 7gt
nmap 88 8gt
nmap 99 9gt
map  zz <Esc>
omap zz <Esc>
imap zz <Esc>
cmap zz <Esc>
nmap <leader>l <C-w>l
nmap <leader>h <C-w>h
nmap <leader>j <C-w>j
nmap <leader>k <C-w>k

"记住最后一次编辑的位置
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

"---------------------------------------------------------------
" Default setting complete
"---------------------------------------------------------------

"---------------------------------------------------------------
" Plugin setting complete
"---------------------------------------------------------------
" 1. NERDTree -------------------------------------
" ----Setting-----------------------------------
let g:NERDTreeHidden = 0                           " 是否显示隐藏文件
let NERDTreeWinSize = 25                           " 设置宽度
" ----Mapping-----------------------------------
map <leader>no :NERDTreeToggle<CR>
map <leader>nt :NERDTree 
" ----Auto-----------------------------------
"autocmd vimenter * NERDTree                        " 打开vim时自动打开
"autocmd vimenter * if !argc()|NERDTree|endif       " 当打开vim没有文件时自动打开
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif    " 当关闭vim且NERDTree为最后窗口时自动关闭

" 2. Fugitive -------------------------------------
" ----Setting-----------------------------------
" ----Mapping-----------------------------------
" ----Auto-----------------------------------

" 3. Air-Line -------------------------------------
" ----Setting-----------------------------------
let g:airline_powerline_fonts = 1                          " 支持 powerline 字体
set ambiwidth=double                                       " 防止特殊符号无法正常显示
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
if has("gui_running")
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = '☰'
    let g:airline_symbols.maxlinenr = ''
endif
" ----Mapping-----------------------------------
" ----Auto-----------------------------------

" 4. Air-Line Themes ------------------------------
" ----Setting-----------------------------------
"let g:airline#extensions#tabline#enabled = 1              " 自动显示所有的buffer，tabe交由airline管理
"let g:airline#extensions#tabline#left_sep = ''            " 在tab名称末尾追加字符
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'default'    " 选择tab中文字的显示模式 unique_tail:仅显示名称
" ----Mapping-----------------------------------
" ----Auto-----------------------------------

" 5. YCM You Complete Me -------------------------------------
" ----Setting-----------------------------------
set completeopt=longest,menu                                   " 让vim的补全菜单行为与一般IDE一般
let g:ycm_key_invoke_completion = '<D-u>'                      " 通常情况下，填充列表会自动弹出，仅当为顶级方法需要查看列表时使用
autocmd insertLeave * if pumvisible() == 0|pclose|endif	       " 离开插入模式后自动关闭预览窗口

"let g:ycm_key_list_select_completion = ['<D-j>', '<Down>']    " 选择下一个选项
"let g:ycm_key_list_previous_completion = ['<D-k>', '<Up>']    " 选择上一个选项
"let g:ycm_key_invoke_completion = '<D-u>'                     " 触发当前选项
" ----Mapping-----------------------------------
" ----Auto-----------------------------------

" 6. LeaderF -------------------------------------
" ----Setting-----------------------------------
" ----Mapping-----------------------------------
map <leader>f :LeaderfFile<CR>
map <leader>b :LeaderfBuffer<CR>
map <leader>r :LeaderfMru<CR>
"map <leader>g :LeaderfFunction<CR>
" ----Auto----------------------------------

" 7. VIM-surround -------------------------------------
" ----Help-----------------------------------
" cs"'  把双引号替换为单引号
" ds"   删除包围符
" ysiw[ 为单词添加包围符
" yss'  为整行添加包围符
" ----Setting-----------------------------------
" ----Mapping-----------------------------------
" ----Auto-----------------------------------

" 8. GO -------------------------------------
" ----Setting-----------------------------------
" 以下配置通过在shell中执行“go env”拉取所有go需要的环境变量
let $PATH="/Users/colin/data/source/go/installation/go/bin:/Users/colin/go/bin:/Users/colin/data/bin:/Users/colin/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
"let $GOARCH="amd64"
let $GOBIN="/Users/colin/data/source/go/bin"
let $GOCACHE="/Users/colin/data/source/go/Caches/go-build"
"let $GOEXE=""
"let $GOFLAGS=""
"let $GOHOSTARCH="amd64"
"let $GOHOSTOS="darwin"
"let $GOOS="darwin"
let $GOPATH="/Users/colin/go"
"let $GOPROXY=""
"let $GORACE=""
let $GOROOT="/Users/colin/data/source/go/installation/go"
"let $GOTMPDIR=""
let $GOTOOLDIR="/Users/colin/data/source/go/installation/go/pkg/tool/darwin_amd64"
"let $GCCGO="gccgo"
"let $CC="clang"
"let $CXX="clang++"
"let $CGO_ENABLED="1"
"let $GOMOD=""
"let $CGO_CFLAGS="-g -O2"
"let $CGO_CPPFLAGS=""
"let $CGO_CXXFLAGS="-g -O2"
"let $CGO_FFLAGS="-g -O2"
"let $CGO_LDFLAGS="-g -O2"
"let $PKG_CONFIG="pkg-config"
"let $GOGCCFLAGS="-fPIC -m64 -pthread -fno-caret-diagnostics -Qunused-arguments -fmessage-length=0 -gno-record-gcc-switches -fno-common"
"
"let g:go_bin_path = "/Users/colin/data/source/go/bin"     " 设置go的bin目录，由于上面设置了GOBIN，所以这里不需要重复设置
let g:go_fmt_command = "goimports"                         " 自动import需要的包
" ----Mapping-----------------------------------
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <leader>a <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>e <Plug>(go-rename)
" ----Auto-----------------------------------

" 9. Ultisnips & VIM Snippets -------------------------------------
" ----Setting-----------------------------------
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<D-u>"
"let g:UltiSnipsJumpForwardTrigger="<D-j>"
"let g:UltiSnipsJumpBackwardTrigger="<D-k>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<C-i>"                                              " 弹出UltiSnips的可用列表,由于不常用, 所以这里设置成了特殊的<C-i>映射
"let g:UltiSnipsJumpForwardTrigger="<C-f>"                                        " <C-f>跳转的到下一个代码块可编辑区
"let g:UltiSnipsJumpBackwardTrigger="<C-b>"                                       " <C-b>跳转到上一个代码块可编辑区
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<tab>"
"let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
"let g:UltiSnipsSnippetDirectories=["snippets", "bundle/ultisnips/UltiSnips"]    " 定义存放代码片段的文件夹 .vim/snippets下，使用自定义和默认的，将会的到全局，有冲突的会提示
" ----Mapping-----------------------------------
" ----Auto-----------------------------------

" 10. vim-colorschemes -------------------------------------
" ----Setting-----------------------------------
" ----Mapping-----------------------------------
" ----Auto-----------------------------------

" 11. nerdtree-git-plugin -------------------------------------
" ----Setting-----------------------------------
" ----Mapping-----------------------------------
" ----Auto-----------------------------------

" 12. VIM Color Solarized -------------------------------------
" ----Setting-----------------------------------
"let g:solarized_termcolors=256
let g:solarized_termtrans=1
let g:solarized_contrast="normal"
let g:solarizedd_visibility="normal"
" ----Mapping-----------------------------------
" ----Auto-----------------------------------

" 13. VIM Color Molokai -------------------------------------
" ----Setting-----------------------------------
let g:molokai_original = 1
" ----Mapping-----------------------------------
" ----Auto-----------------------------------

" 14. NerdComment -------------------------------------
" ----Setting-----------------------------------
let g:NERDSpaceDelims = 1                     " 自动在注释后面添加空格
" ----Mapping-----------------------------------
" ----Auto-----------------------------------
