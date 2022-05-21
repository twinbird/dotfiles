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
set number      "行番号表示on
set incsearch   "インクリメンタルサーチ(入力ごとに検索するやつ)on
set ignorecase  "大文字小文字に関係なく検索
set smartcase   "検索パターンに大文字を含んだ場合は大文字小文字を区別する
set showmatch   "括弧入力時に対応する括弧を強調
set showmode    "モードの表示
set backspace=2 "改行、インデントをバックスペースで削除可能に
set title       "編集中のファイル名を表示
set ruler       "ルーラー(右下に出る行数を表示するの)を表示
set noswapfile  "スワップファイルを作らない
set nobackup    "バックアップファイルを作らない
set noundofile  "undoファイルを作らない
set viminfo=    "viminfoファイルを作らない
set hlsearch    "検索結果をハイライト
set wrapscan    "検索結果の末尾まで来たら先頭から探し直す
set wildmenu wildmode=list:full   "補完機能を強化
set wrap        "長い行は折り返す
set undolevels=100 "undoできる数

"カラースキーム
colorscheme desert

"折りたたみ
set foldmethod=syntax
set foldlevel=100
set foldcolumn=2

"選択中タブの色
highlight TabLineSel ctermfg=Black ctermbg=LightGreen

"ハイライトをEsc2回で消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>

":findで探せるように開いたディレクトリ以下をpathに入れる
set path+=**

"grep検索結果をQuickFixウィンドウへ出力
autocmd QuickFixCmdPost *grep* cwindow

"---------------------------------------------------------------------------
" ステータスライン
"---------------------------------------------------------------------------
"	選択中の行数と文字数を数える関数
function! VisualSelectionSize()
    if mode() == "v"
        exe "normal \<ESC>gv"
        if line("'<") != line("'>")
            return (line("'>") - line("'<") + 1) . ' lines'
        else
            return (col("'>") - col("'<") + 1) . ' chars'
        endif
    elseif mode() == "V"
        exe "normal \<ESC>gv"
        return (line("'>") - line("'<") + 1) . ' lines'
    elseif mode() == "\<C-V>"
        exe "normal \<ESC>gv"
        return (line("'>") - line("'<") + 1) . 'x' . (abs(col("'>") - col("'<")) + 1) . ' block'
    else
        return ''
    endif
endfunction
set statusline=%f "ファイル相対パス
set statusline+=%m "修正フラグ
set statusline+=%r "読み取り専用フラグ
set statusline+=%= "以降右詰め
set statusline+=[%l/%L] "行数
set statusline+=[%c] "列数
set statusline+=[%{VisualSelectionSize()}] "選択中の行数
set statusline+=[%{(&fenc!=''?&fenc:&enc).':'.&ff}] "ファイルエンコーディング
set laststatus=2 "常に表示

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
" 標準プラグインの設定
"---------------------------------------------------------------------------
" netrw
let g:netrw_banner = 0 "バナーを非表示にする
let g:netrw_liststyle = 3 "tree viewにしておく

" matchit(タグ対応移動を強化する)
source $VIMRUNTIME/macros/matchit.vim
" ビジュアルモードで選択した範囲を_jで両端揃えにする
source $VIMRUNTIME/macros/justify.vim

"---------------------------------------------------------------------------
" インデント
"---------------------------------------------------------------------------
set autoindent  "自動インデント
set smartindent	"賢いインデントに
set tabstop=4   "タブ数
set softtabstop=0   "tabstopと同じ
set shiftwidth=4 "autoindentの改行時のタブ数
set noexpandtab "タブをスペースに置き換えない
"拡張子に合わせていい感じに
filetype on
filetype indent on
filetype plugin on

"sw=shiftwidth, sts=softtabstop, ts=tabstop, et=expandtab
autocmd FileType c           setlocal sw=2 sts=0 ts=2 et
autocmd FileType cpp         setlocal sw=2 sts=0 ts=2 et
autocmd FileType go          setlocal sw=4 sts=0 ts=4 noet
autocmd FileType sh          setlocal sw=2 sts=0 ts=2 et
autocmd FileType javascript  setlocal sw=2 sts=0 ts=2 et
autocmd FileType html        setlocal sw=4 sts=0 ts=4 et
autocmd FileType json        setlocal sw=4 sts=0 ts=4 et
autocmd FileType php         setlocal sw=4 sts=0 ts=4 et

"---------------------------------------------------------------------------
" 言語別設定
"---------------------------------------------------------------------------
" PHP
let g:php_baselib       = 1
let g:php_htmlInStrings = 1
let g:php_noShortTags   = 1
let g:php_sql_query     = 1

" sh(bash)
let g:is_bash = 1
let g:sh_fold_enabled= 3

