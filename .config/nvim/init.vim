" XDG Base Directory specification
if empty($XDG_CACHE_HOME) | let $XDG_CACHE_HOME = $HOME."/.cache" | end
if empty($XDG_CONFIG_HOME) | let $XDG_CONFIG_HOME = $HOME."/.config" | end
if empty($XDG_DATA_HOME) | let $XDG_DATA_HOME = $HOME."/.local/share" | end

if &compatible | set nocompatible | end
set encoding=utf8
set ffs=unix,dos " Unix basedでファイルを取り扱う
set clipboard+=unnamedplus " システムのクリップボードも用いる
set lazyredraw " マクロ実行時、再描画を遅延させる
set showmatch " ブラケットにカーソルがあたっている時、マッチするものも含めてハイライトする

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 検索
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set wrapscan " 最後まで検索したら、最初に戻す
set hlsearch " 検索をハイライトする
set incsearch " インクリメンタルサーチを用いる
nnoremap <ESC><ESC> :nohlsearch<CR> " ESC連打で検索結果のハイライトを消す

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" バックアップ
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set backupdir=$XDG_CACHE_HOME/nvim/backup | call mkdir(&backupdir, 'p', 0700) " バックアップファイルのディレクトリを指定
set directory=$XDG_CACHE_HOME/nvim/swap | call mkdir(&directory, 'p', 0700) " スワップファイルのディレクトリを指定

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" タブ・テキストの扱い
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab " タブ入力時、同じ幅分のスペースで代替する
set tabstop=4 " タブ一つをスペース四つ分で表示する
set softtabstop=4 " タブ一つを入力した際、スペース四つで入力する
set shiftwidth=4 " 自動インデントはスペース四つ分

set autoindent " 自動インデントを有効化
set smartindent
set smarttab

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" dein.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let s:dein_cache_dir = $XDG_CACHE_HOME.'/dein'
let s:dein_repo_dir = $XDG_CACHE_HOME.'/dein/repos/github.com/Shougo/dein.vim'

execute 'set runtimepath+='.s:dein_repo_dir

call dein#begin(s:dein_cache_dir)

call dein#add(s:dein_repo_dir) " dein自身をdeinで管理させる

" Airline
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')

" Color schemes
call dein#add('ayu-theme/ayu-vim')

call dein#end()

filetype plugin indent on

" 未インストールなプラグインをスタートアップ時にインストールする
if dein#check_install()
    call dein#install()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='ayu_dark'
let g:airline#extensions#tabline#enabled = 1 " タブが一つだけのとき、自動で全バッファのリストを表示させる
let g:airline_powerline_fonts = 1 " AirlineでPowerline fontsを用いる

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 見た目の設定
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set noshowmode " モードを表示しない
set background=dark
set termguicolors
let ayucolor="dark"
colorscheme ayu
