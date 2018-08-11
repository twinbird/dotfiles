set nocompatible "vi互換モードoff
set smartindent	"賢いインデントに
syntax on       "構文カラー表示on
set number      "行番号表示on
set relativenumber " 行番号を相対表示に
set incsearch   "インクリメンタルサーチ(入力ごとに検索するやつ)on
set ignorecase  "大文字小文字に関係なく検索
set showmatch   "括弧入力時に対応する括弧を強調
set showmode    "モードの表示
set backspace=2 "改行、インデントをバックスペースで削除可能に
set title       "編集中のファイル名を表示
set ruler       "ルーラー(右下に出る行数を表示するの)を表示
set tabstop=4   "タブ数
set shiftwidth=4 "autoindentの改行時のタブ数
set noexpandtab "タブをスペースに置き換えない
set noswapfile  "スワップファイルを作らない
set nobackup    "バックアップファイルを作らない
set hlsearch    "検索結果をハイライト
set wrapscan    "検索結果の末尾まで来たら先頭から探し直す
set wildmenu wildmode=list:full   "補完機能を強化
set wrap        "長い行は折り返す
set undolevels=100 "undoできる数
set cursorline "横ラインを引く
"ハイライトをEsc2回で消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"vimgrep関連のマッピング
"ctrl-g2回でカーソル文字列をvimgrep(jumpはしない.オプションj)
nmap <C-G><C-G> :vimgrep /<C-R><C-W>/j **/*
"Quickfix結果を別ウィンドウで開く
autocmd QuickFixCmdPost *grep* cwindow

"拡張子に合わせていい感じに
filetype on
filetype indent on
filetype plugin on

"カラースキーム
colorscheme elflord

"折りたたみ
"  シンタックスで折りたたみ
set foldmethod=syntax
set foldlevel=100
set foldcolumn=3

"エンコーディング
let $LANG='ja_JP.UTF-8'
set encoding=utf-8
set fileencodings=utf-8,cp932
set fileformats=unix,dos,mac

"ステータスライン
set statusline=%f "ファイル相対パス
set statusline+=%m "修正フラグ
set statusline+=%r "読み取り専用フラグ
set statusline+=%= "以降右詰め
set statusline+=[%l/%L] "行数
set statusline+=[%c] "列数
set statusline+=[%{(&fenc!=''?&fenc:&enc).':'.&ff}] "ファイルエンコーディング
set laststatus=2 "常に表示

"vimplenote
source ~/.vimplenoterc
"縦スプリットでウィンドウを作る
let g:VimpleNoteVertical=1
"マッピング
:command Memo VimpleNote -l
:command MemoNew VimpleNote -n
:command MemoDel VimpleNote -d

"ウィンドウ幅の変更のためのマッピング
nnoremap <up> :resize +1<CR>
nnoremap <down> :resize -1<CR>
nnoremap <left> :vertical resize -1<CR>
nnoremap <right> :vertical resize +1<CR>
