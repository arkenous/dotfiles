set encoding=utf-8
if &compatible
  set nocompatible
endif
set clipboard+=unnamedplus

"タブ幅の設定
set expandtab "タブをスペースに置き換える
set tabstop=2 "インデントをスペース2つ分に設定
set softtabstop=2 "Tabキーを押した時に挿入される空白の量
set shiftwidth=2 "vimが自動的に挿入するインデントなどの幅

"##### 検索設定 #####
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set incsearch "インクリメンタルサーチを行う

"--------------------
"" 基本的な設定
"--------------------
" 新しい行のインデントを現在行と同じにする
set autoindent
set smartindent

" 新しい行を作った時に高度な自動インデントを行う
set smarttab

" バックアップファイルのディレクトリを指定する
set backupdir=$HOME/vimbackup

"" スワップファイル用のディレクトリを指定する
set directory=$HOME/vimbackup

"" 変更中のファイルでも，保存しないで他のファイルを表示する
set hidden

"" 行番号を表示する
set number

" 閉じ括弧が入力された時，対応する括弧を強調する
set showmatch

" grep検索を設定する
set grepformat=%f:%l:%m,%f:%l%m,%f\ \ %l%m,%f
set grepprg=grep\ -nh

" 検索結果のハイライトをEsc連打でクリアする
nnoremap <ESC><ESC> :nohlsearch<CR>

" mapping関係カスタマイズ
map \ <leader>
noremap ; :
noremap : ;

set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%

" 全角スペース・行末のスペース・タブの可視化
if has("syntax")
    syntax on

    " PODバグ対策
    syn sync fromstart

    function! ActivateInvisibleIndicator()
        " 下の行の"　"は全角スペース
        syntax match InvisibleJISX0208Space "　" display containedin=ALL
        highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
        "syntax match InvisibleTrailedSpace "[ \t]$" display containedin=ALL
        "highlight InvisibleTrailedSpace term=underline ctermbg=Red guibg=NONE gui=undercurl guisp=darkorange
        "syntax match InvisibleTab "\t" display containedin=ALL
        "highlight InvisibleTab term=underline ctermbg=white gui=undercurl guisp=darkslategray
    endfunction

    augroup invisible
        autocmd! invisible
        autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
    augroup END
endif

" ##### dein #####
let g:cache_home = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let g:config_home = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME

let s:dein_cache_dir = g:cache_home . '/dein'

if &runtimepath !~# '/dein.vim'
  let s:dein_repo_dir = s:dein_cache_dir . '/repos/github.com/Shougo/dein.vim'

  " Auto Download
  if !isdirectory(s:dein_repo_dir)
    call system('git clone https://github.com/Shougo/dein.vim ' . shellescape(s:dein_repo_dir))
  endif

  " dein.vim をプラグインとして読み込む
  execute 'set runtimepath^=' . s:dein_repo_dir
endif

" dein.vim settings
let g:dein#install_max_processes = 16
let g:dein#enable_notification = 1
let g:python3_host_prog = $PYENV_ROOT . '/versions/neovim3/bin/python'

if dein#load_state(s:dein_cache_dir)
  call dein#begin(s:dein_cache_dir)

  call dein#add('Shougo/dein.vim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('zchee/deoplete-jedi')
  call dein#add('zchee/deoplete-clang')
  call dein#add('artur-shaik/vim-javacomplete2')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('cohama/lexima.vim')
  call dein#add('jacoborus/tender.vim')
  call dein#add('vim-airline/vim-airline')

  call dein#end()
  call dein#save_state()
endif

if has('vim_starting') && dein#check_install()
  call dein#install()
endif

let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#clang#libclang_path = '/Library/Developer/CommandLineTools/usr/lib/libclang.dylib'
let g:deoplete#sources#clang#clang_header = '/usr/local/Cellar/llvm/4.0.1/lib/clang'

autocmd FileType java setlocal omnifunc=javacomplete#Complete

if (has("termguicolors"))
  set termguicolors
endif
syntax enable
filetype plugin indent on
colorscheme tender

let g:airline_powerline_fonts = 1
set laststatus=2
set noshowmode
set t_Co=256
let g:airline_theme = 'tenderplus'
