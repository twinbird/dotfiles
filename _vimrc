"---------------------------------------------------------------------------
" エンコーディング
"---------------------------------------------------------------------------
let $LANG='ja_JP.UTF-8'
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,cp932
set fileformats=unix,dos,mac
set ambiwidth=double

"---------------------------------------------------------------------------
" 一般
"---------------------------------------------------------------------------
set nocompatible "vi互換モードoff
syntax on       "構文カラー表示on
set showmatch   "括弧入力時に対応する括弧を強調
set backspace=2 "改行、インデントをバックスペースで削除可能に
set wildmenu wildmode=list:full   "補完機能を強化
set wildoptions=fuzzy "補完をファジーに
set undolevels=100 "undoできる数
set list listchars=tab:>- "タブを表示
set number " 行番号を表示

" 検索
set incsearch   "インクリメンタルサーチ(入力ごとに検索するやつ)on
set ignorecase  "大文字小文字に関係なく検索
set smartcase   "検索パターンに大文字を含んだ場合は大文字小文字を区別する
set hlsearch    "検索結果をハイライト

" 仮ファイルは作らない
set noswapfile  "スワップファイルを作らない
set nobackup    "バックアップファイルを作らない
set noundofile  "undoファイルを作らない
set viminfo=    "viminfoファイルを作らない

"カラースキーム
colorscheme desert
"選択中タブの色
highlight TabLineSel ctermfg=Black ctermbg=LightGreen
"タブインデントの色
highlight SpecialKey ctermbg=None ctermfg=59

"ハイライトをEsc2回で消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>

":findで探せるように開いたディレクトリ以下をpathに入れる
set path+=**

" ステータスラインを表示
set laststatus=2

" 編集中ファイルでもバッファ切り替えできるように
set hidden
" バッファ操作のバインディング
nnoremap <silent> <C-j> :bnext<CR>
nnoremap <silent> <C-k> :bprev<CR>

" Insertモードから出るときにnopasteにする
autocmd InsertLeave * set nopaste

" clipboard有効化
set clipboard=unnamedplus

"---------------------------------------------------------------------------
" マウス設定
"---------------------------------------------------------------------------
if has('mouse')
  set mouse=a
  if has('mouse_sgr')
    set ttymouse=sgr
  elseif v:version > 703 || v:version is 703 && has('patch632')
    set ttymouse=sgr
  else
    set ttymouse=xterm2
  endif
endif

"---------------------------------------------------------------------------
" grepとQuickFix
"---------------------------------------------------------------------------
" grepはgit grepにする
set grepprg=git\ grep\ -I\ -n\ --no-color

" キーバインド
nnoremap <silent> <C-n> :cnext<CR>
nnoremap <silent> <C-p> :cprev<CR>

" grep検索結果をQuickFixウィンドウへ出力
autocmd QuickFixCmdPost *grep* cwindow

"---------------------------------------------------------------------------
" 標準プラグインの設定
"---------------------------------------------------------------------------
" netrw
let g:netrw_banner = 0 "バナーを非表示にする
" matchit
silent! packadd! matchit
" editorconfig
silent! packadd! editorconfig
" comment
silent! packadd! comment

"---------------------------------------------------------------------------
" インデント
"---------------------------------------------------------------------------
set autoindent  "自動インデント
set smartindent "賢いインデントに
filetype on
filetype indent on
filetype plugin on

" デフォルトでは2スペースにしとく
set sw=2
set sts=0
set ts=2
set expandtab

"---------------------------------------------------------------------------
" プラグイン
"---------------------------------------------------------------------------
call plug#begin()
Plug 'babarot/vim-buftabs'
Plug 'godlygeek/tabular'
call plug#end()
