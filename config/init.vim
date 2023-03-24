"----------------------------------------------------------
" 導入プラグイン
"----------------------------------------------------------
call plug#begin('~/.config/nvim/plugged')
  " git
  Plug 'airblade/vim-gitgutter'
  " テーマ
  Plug 'crusoexia/vim-monokai'
  " ステータスラインの表示内容強化
  Plug 'itchyny/lightline.vim'
  " インデントの可視化
  Plug 'Yggdroot/indentLine'
  " 末尾の全角半角空白文字を赤くハイライト
  Plug 'bronson/vim-trailing-whitespace'
  " fzf(あいまい検索)
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " lsp
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " ファイラー
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-hijack.vim'
call plug#end()

"----------------------------------------------------------
" 基本設定
"----------------------------------------------------------
set encoding=utf-8
scriptencoding utf-8
" クリップボード連携
"set clipboard=unnamed,autoselect
"set clipboard&
"set clipboard^=unnamedplus
set clipboard+=unnamed
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" エラーメッセージの表示時にビープを鳴らさない
set noerrorbells
set visualbell "ビープ音を視覚表示
" 新しいウィンドウを右に開く
set splitright
" ファイラ機能をONにする
filetype plugin on
" tree view
let g:netrw_liststyle = 3
" 上部に表示される情報を非表示
let g:netrw_banner = 0
" プレビューウィンドウを垂直分割で表示する
let g:netrw_preview=1
" 矢印でも自動補完をするようにする
inoremap <expr> <down> ((pumvisible())?("\<C-n>"):("\<down>"))
inoremap <expr> <up> ((pumvisible())?("\<C-p>"):("\<up>"))

" 1件でも候補があれば補完を表示し、補完の選択はEnterにする。
" set completeopt=menuone,noinsert
" 補完表示時のEnterで改行をしない
" inoremap <expr><CR>  pumvisible() ? "<C-y>" : "<CR>"

" ビープを無効
set visualbell t_vb=
" マウス有効
" set mouse=a
" 行末のチルダを削除
highlight link EndOfBuffer Ignore

"----------------------------------------------------------
" 文字
"----------------------------------------------------------
set fileencoding=utf-8 " 保存時の文字コード
set fileencodings=ucs-boms,utf-8,euc-jp,cp932 " 読み込み時の文字コードの自動判別. 左側が優先される
set fileformats=unix,dos,mac " 改行コードの自動判別. 左側が優先される
"set ambiwidth=double " □や○文字が崩れる問題を解決
set list
set listchars=tab:»-,trail:-,extends:»,precedes:«,nbsp:%

"----------------------------------------------------------
" git
"----------------------------------------------------------
set updatetime=100

"----------------------------------------------------------
" 日時表示
"----------------------------------------------------------
let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
let wday = strftime("%w")
command! Time echo strftime('%Y-%m-%d ').weeks[wday].strftime(' %H:%M')

"----------------------------------------------------------
" ターミナル設定
"----------------------------------------------------------
" <Esc> で :terminal の insert を抜ける
tnoremap <Esc> <C-w><S-n>
" タブ移動キー設定
tnoremap <C-j> <C-w>g<S-t>
tnoremap <C-k> <C-w>gt
" タブでターミナルを開く
command! Ttm :tab terminal

"----------------------------------------------------------
" カラースキーム
"----------------------------------------------------------
syntax on
colorscheme monokai

set t_Co=256
let g:rehash256 = 1

"記号列（左のエリア）を透明にする
highlight clear SignColumn
"背景を透明にする
highlight Normal ctermbg=none
highlight NonText ctermbg=none
highlight LineNr ctermbg=none
highlight Folded ctermbg=none
highlight EndOfBuffer ctermbg=none

"----------------------------------------------------------
" カーソル
"----------------------------------------------------------
set number " 行番号を表示
"set cursorline " カーソルラインをハイライト

" バックスペースキーの有効化
set backspace=indent,eol,start
let &t_EI .= "\e[1 q" "カーソル形状変更

"----------------------------------------------------------
" タブページ
"----------------------------------------------------------
" set showtabline=2 "常にタブを表示させておく
" let s:palette = g:lightline#colorscheme#powerline#palette
" let s:palette.tabline.tabsel = [ [ '#1c1e1e', '#afdf02', 016, 118, 'bold' ] ]
" let s:palette.tabline.middle = [ [ '#f8f8f8', '#1c1e1e', 015, 016, 'bold' ] ]
" unlet s:palette

"----------------------------------------------------------
" ステータスライン
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの位置を表示する

"----------------------------------------------------------
" コマンドモード
"----------------------------------------------------------
set wildmenu " コマンドモードの補完
set history=5000 " 保存するコマンド履歴の数

"----------------------------------------------------------
" タブ・インデント
"----------------------------------------------------------
set expandtab " タブ入力を複数の空白入力に置き換える
set tabstop=2 " 画面上でタブ文字が占める幅
set softtabstop=2 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set shiftwidth=2 " smartindentで増減する幅
set autoindent " 改行時に前の行のインデントを継続する
set smartindent " 改行時に前の行の構文をチェックし次の行のインデントを増減する

"タブ、空白、改行の可視化
set list
set listchars=tab:->,

"----------------------------------------------------------
" 文字列検索
"----------------------------------------------------------
set incsearch " インクリメンタルサーチ. １文字入力毎に検索を行う
set ignorecase " 検索パターンに大文字小文字を区別しない
set smartcase " 検索パターンに大文字を含んでいたら大文字小文字を区別する
set hlsearch " 検索結果をハイライト

"----------------------------------------------------------
" カッコ・タグの対応
"----------------------------------------------------------
"対応括弧の表示
" let loaded_matchparen = 1
" 括弧の対応関係を表示する
"set showmatch

"set matchtime=1

" Vimの「%」を拡張する
"source $VIMRUNTIME/macros/matchit.vim
" 対応括弧に<と>のペアを追加
"set matchpairs& matchpairs+=<:>

"----------------------------------------------------------
" indentLine
"----------------------------------------------------------
"let g:indentLine_color_term = 111
"let g:indentLine_color_gui = '#696969'
let g:indentLine_char = '¦'

"----------------------------------------------------------
" fzf
"----------------------------------------------------------
" ripgrepで検索中、?を押すとプレビュー:
"command! -bang -nargs=* Rg
"  \ call fzf#vim#grep(
"  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"  \   <bang>0 ? fzf#vim#with_preview('up:60%')
"  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \   <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

" Filesコマンドにもプレビューを出す
let g:fzf_layout = { 'window': { 'width': 0.7, 'height': 0.6 } }
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)


"----------------------------------------------------------
" lightline
"----------------------------------------------------------
let g:lightline = {
        \ 'mode_map': {'c': 'NORMAL'},
        \ 'active': {
        \   'left': [ [ 'mode', 'paste' ], [ 'fugitive'], [ 'filepath' ]]
        \ },
        \ 'component_function': {
        \   'modified': 'LightlineModified',
        \   'readonly': 'LightlineReadonly',
        \   'fugitive': 'LightlineFugitive',
        \   'filepath': 'LightlineFilePath',
        \   'fileformat': 'LightlineFileformat',
        \   'filetype': 'LightlineFiletype',
        \   'fileencoding': 'LightlineFileencoding',
        \   'mode': 'LightlineMode'
        \ }
        \ }

function! LightlineModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! LightlineReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? 'x' : ''
endfunction

function! LightlineFilename()
  return ('' != LightlineReadonly() ? LightlineReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:t') ? expand('%:t') : '[No Name]') .
        \ ('' != LightlineModified() ? ' ' . LightlineModified() : '')
endfunction

function! LightlineFilePath()
  if winwidth(0) > 90
    return expand("%:s")
  else
    return expand("%:t")
  endif
endfunction

function! LightlineFugitive()
  if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head')
    return fugitive#head()
  else
    return ''
  endif
endfunction

function! LightlineFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! LightlineFiletype()
  return winwidth(0) > 70 ? (&filetype !=# '' ? &filetype : 'no ft') : ''
endfunction

function! LightlineFileencoding()
  return winwidth(0) > 70 ? (&fenc !=# '' ? &fenc : &enc) : ''
endfunction

function! LightlineMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

"----------------------------------------------------------
" Fern
"----------------------------------------------------------
noremap <silent> <Leader>. :Fern . -drawer -width=35 -toggle<CR><C-w>=
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>
let g:fern#default_hidden = 1

"----------------------------------------------------------
" 速度検証用スクリプト
"----------------------------------------------------------
" 下記を実行して~/logのFUNCTIONS SORTED ON TOTAL TIMEを確認する
" $ vim +'call ProfileCursorMove()' <カーソルを動かすのが重いファイル>
function! ProfileCursorMove() abort
  let profile_file = expand('~/log/vim-profile.log')
  if filereadable(profile_file)
    call delete(profile_file)
  endif

  normal! gg
  normal! zR

  execute 'profile start ' . profile_file
  profile func *
  profile file *

  augroup ProfileCursorMove
    autocmd!
    autocmd CursorHold <buffer> profile pause | q
  augroup END

  for i in range(100)
    call feedkeys('j')
  endfor
endfunction

"----------------------------------------------------------
" 速度検証用スクリプト
"----------------------------------------------------------
" :Profileと入力して作業すると ~/log/profile.txt にログが出力される
" :vim <ダブルクォート>Total time<ダブルクォート> % のあとに :copen を実行すると便利
command! Profile call s:command_profile()
function! s:command_profile() abort
  profile start ~/log/profile.txt
  profile func *
  profile file *
endfunction

