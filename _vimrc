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
" バッファ操作のバインディング
nnoremap <silent> <C-j> :bnext<CR>
nnoremap <silent> <C-k> :bprev<CR>

":findで探せるように開いたディレクトリ以下をpathに入れる
set path+=**

"grep検索結果をQuickFixウィンドウへ出力
autocmd QuickFixCmdPost *grep* cwindow

" ステータスラインを表示
set laststatus=2

" 編集中ファイルでもバッファ切り替えできるように
set hidden

" OSとのクリップボード共有
set clipboard&
set clipboard^=unnamedplus

"---------------------------------------------------------------------------
" マウス設定
"---------------------------------------------------------------------------
if has('mouse')
  set mouse=a
  set ttymouse=xterm2
endif

"---------------------------------------------------------------------------
" 標準プラグインの設定
"---------------------------------------------------------------------------
" netrw
let g:netrw_banner = 0 "バナーを非表示にする
let g:netrw_liststyle = 3 "tree viewにしておく

" matchit(タグ対応移動を強化する)
source $VIMRUNTIME/macros/matchit.vim
"---------------------------------------------------------------------------
" インデント
"---------------------------------------------------------------------------
set autoindent  "自動インデント
set smartindent "賢いインデントに
filetype on
filetype indent on
filetype plugin on

" デフォルトでは4タブにしとく
set sw=4
set sts=0
set ts=4
set noex

"---------------------------------------------------------------------------
" 言語別設定
"---------------------------------------------------------------------------
" インデント
"sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtab
augroup ag2indent
	autocmd FileType c                setlocal sw=2 sts=0 ts=2 et
	autocmd FileType cpp              setlocal sw=2 sts=0 ts=2 et
	autocmd FileType go               setlocal sw=4 sts=0 ts=4 noet
	autocmd FileType sh               setlocal sw=2 sts=0 ts=2 et
	autocmd FileType javascript       setlocal sw=2 sts=0 ts=2 et
	autocmd FileType typescript       setlocal sw=2 sts=0 ts=2 et
	autocmd FileType javascriptreact  setlocal sw=2 sts=0 ts=2 et
	autocmd FileType typescriptreact  setlocal sw=2 sts=0 ts=2 et
	autocmd FileType vue              setlocal sw=2 sts=0 ts=2 et
	autocmd FileType html             setlocal sw=4 sts=0 ts=4 et
	autocmd FileType json             setlocal sw=4 sts=0 ts=4 et
	autocmd FileType php              setlocal sw=4 sts=0 ts=4 noet
	autocmd FileType text             setlocal sw=2 sts=0 ts=2 et nonumber
augroup END

" PHP
let g:php_baselib       = 0
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1

" sh(bash)
let g:is_bash = 1
let g:sh_fold_enabled= 3

