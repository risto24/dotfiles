-- ----------------------------------------------------------
-- 導入プラグイン
-- ----------------------------------------------------------
vim.cmd [[
  call plug#begin('~/.config/nvim/plugged')
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'itchyny/lightline.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'bronson/vim-trailing-whitespace'
  " Git
  Plug 'airblade/vim-gitgutter'
  " Colorscheme
  Plug 'EdenEast/nightfox.nvim'
  "FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " ファイラ
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-hijack.vim'
  " LSP
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/mason.nvim'
  Plug 'williamboman/mason-lspconfig.nvim'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  call plug#end()
]]

-- ----------------------------------------------------------
-- 基本設定
-- ----------------------------------------------------------
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
-- バックアップファイルを作らない
vim.o.backup = false
-- スワップファイルを作らない
vim.o.swapfile = false
-- エラーメッセージの表示時にビープを鳴らさない
vim.o.errorbells = false
-- ビープ音を視覚表示
vim.o.visualbell = true
vim.opt.visualbell = true
vim.o.splitright = true -- 新しいウィンドウを右に開く
vim.cmd [[
  " ファイラ機能をONにする
  filetype plugin on
  " tree view
  let g:netrw_liststyle = 3
  " 上部に表示される情報を非表示
  let g:netrw_banner = 0
  " プレビューウィンドウを垂直分割で表示する
  let g:netrw_preview = 1
]]
-- マウス有効
vim.o.mouse = 'a'
vim.cmd [[
  " 行末のチルダを削除
  highlight link EndOfBuffer Ignore
  " 外部でファイルに変更がされた場合は読みなおす
  set autoread
  " スペルチェックを有効化
  " set spell
  " set spelllang=en,cjk
  " ステータスラインを１つにする
  set laststatus=3
]]

-- ----------------------------------------------------------
-- clipboard
-- ----------------------------------------------------------
-- " クリップボード連携
vim.opt.clipboard = 'unnamedplus'
vim.o.clipboard = 'unnamedplus'
-- クリップボード無効化 for EC2
-- set clipboard=

-- クリップボード連携 for EC2
-- augroup osc52
--   autocmd!
--   autocmd TextYankPost * if v:event.operator ==# 'y' | call SendViaOSC52(getreg(v:event.regname)) | endif
-- augroup END

-- ----------------------------------------------------------
-- 文字
-- ----------------------------------------------------------
vim.o.fileencoding = 'utf-8' -- 保存時の文字コード
-- 読み込み時の文字コードの自動判別. 左側が優先される
vim.o.fileencodings = 'ucs-boms,utf-8,euc-jp,cp932'
-- 改行コードの自動判別. 左側が優先される
vim.o.fileformats = 'unix,dos,mac'
vim.o.list = true
vim.o.listchars = 'tab:»-,trail:-,extends:»,precedes:«,nbsp:%'

-- ----------------------------------------------------------
-- git
-- ----------------------------------------------------------
vim.o.updatetime = 100

-- ----------------------------------------------------------
-- 日時表示
-- ----------------------------------------------------------
vim.cmd [[
  let weeks = [ "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" ]
  let wday = strftime("%w")
  command! Time echo strftime('%Y-%m-%d ').weeks[wday].strftime(' %H:%M')
]]

-- ----------------------------------------------------------
-- ターミナル設定
-- ----------------------------------------------------------
-- <Esc> で :terminal の insert を抜ける
vim.api.nvim_set_keymap('t', '<Esc>', '<C-w><S-n>', { noremap = true, silent = true })
-- タブ移動キー設定
vim.api.nvim_set_keymap('t', '<C-j>', '<C-w>g<S-t>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-w>gt', { noremap = true, silent = true })
-- タブでターミナルを開く
vim.cmd [[command! Ttm :tab terminal]]

-- ----------------------------------------------------------
-- カラースキーム
-- ----------------------------------------------------------
vim.cmd [[
  syntax on
  lua require('nightfox').setup({options={transparent=true}})
  colorscheme nightfox
  set t_Co=256
  let g:rehash256 = 1
]]

-- ----------------------------------------------------------
-- カーソル
-- ----------------------------------------------------------
vim.o.number = true -- 行番号を表示
-- set cursorline -- カーソルラインをハイライト
vim.o.backspace = 'indent,eol,start' -- バックスペースキーの有効化
vim.cmd [[let &t_EI .= "\e[1 q"]] -- カーソル形状変更

-- ----------------------------------------------------------
-- ステータスライン
-- ----------------------------------------------------------
vim.o.laststatus=2 -- ステータスラインを常に表示
vim.o.showmode = true -- 現在のモードを表示
vim.o.showcmd = true -- 打ったコマンドをステータスラインの下に表示
vim.o.ruler = true -- ステータスラインの右側にカーソルの位置を表示する


-- ----------------------------------------------------------
-- コマンドモード
-- ----------------------------------------------------------
vim.o.wildmenu = true -- コマンドモードの補完
vim.o.history = 5000 -- 保存するコマンド履歴の数

-- ----------------------------------------------------------
-- タブ・インデント
-- ----------------------------------------------------------
vim.o.expandtab=true -- タブ入力を複数の空白入力に置き換える
vim.o.tabstop=2 -- 画面上でタブ文字が占める幅
vim.o.softtabstop=2 -- 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
vim.o.shiftwidth=2 -- smartindentで増減する幅
vim.o.autoindent=true -- 改行時に前の行のインデントを継続する
vim.o.smartindent=true -- 改行時に前の行の構文をチェックし次の行のインデントを増減する

--タブ、空白、改行の可視化
vim.o.list = true
vim.opt.listchars = { tab = '->' }

-- jsonのダブルクオートを表示する
vim.cmd [[let g:vim_json_conceal=0]]

-- ----------------------------------------------------------
-- 文字列検索
-- ----------------------------------------------------------
vim.o.incsearch = true -- インクリメンタルサーチ. １文字入力毎に検索を行う
vim.o.ignorecase = true -- 検索パターンに大文字小文字を区別しない
vim.o.smartcase = true -- 検索パターンに大文字を含んでいたら大文字小文字を区別する
vim.o.hlsearch = true -- 検索結果をハイライト

-- ----------------------------------------------------------
-- indentLine
-- ----------------------------------------------------------
vim.g.indentLine_char = '¦'

-- ----------------------------------------------------------
-- fzf
-- ----------------------------------------------------------
-- Filesコマンドにもプレビューを出す
vim.g.fzf_layout = { window = { width = 0.7, height = 0.6 } }
vim.cmd [[
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
]]

-- ----------------------------------------------------------
-- Fern
-- ----------------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>.', ':Fern . -drawer -width=35 -toggle<CR><C-w>=', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<down>', ':Fern . -reveal=% -drawer -toggle -width=40<CR>', { noremap = true, silent = true })
vim.g.fern_default_hidden = 1

-- ----------------------------------------------------------
-- LSP
-- ----------------------------------------------------------
-- 1. LSP Sever management
require('mason').setup()
require('mason-lspconfig').setup_handlers({ function(server)
  local opt = {
    -- -- Function executed when the LSP server startup
    -- on_attach = function(client, bufnr)
    --   local opts = { noremap=true, silent=true }
    --   vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    --   vim.cmd 'autocmd BufWritePre * lua vim.lsp.buf.formatting_sync(nil, 1000)'
    -- end,
    capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  require('lspconfig')[server].setup(opt)
end })

-- 2. build-in LSP function
-- keyboard shortcut
vim.keymap.set('n', 'K',  '<cmd>lua vim.lsp.buf.hover()<CR>')
vim.keymap.set('n', 'gf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
vim.keymap.set('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>')
vim.keymap.set('n', 'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
vim.keymap.set('n', 'gn', '<cmd>lua vim.lsp.buf.rename()<CR>')
vim.keymap.set('n', 'ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
vim.keymap.set('n', 'ge', '<cmd>lua vim.diagnostic.open_float()<CR>')
vim.keymap.set('n', 'g]', '<cmd>lua vim.diagnostic.goto_next()<CR>')
vim.keymap.set('n', 'g[', '<cmd>lua vim.diagnostic.goto_prev()<CR>')
-- LSP handlers
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, { virtual_text = false }
)
-- Reference highlight
vim.cmd [[
set updatetime=500
highlight LspReferenceText  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#00000000 guibg=#363636
highlight LspReferenceRead  cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#00000000 guibg=#363636
highlight LspReferenceWrite cterm=underline ctermfg=1 ctermbg=8 gui=underline guifg=#00000000 guibg=#363636
augroup lsp_document_highlight
  autocmd!
  autocmd CursorHold,CursorHoldI * lua vim.lsp.buf.document_highlight()
  autocmd CursorMoved,CursorMovedI * lua vim.lsp.buf.clear_references()
augroup END
]]

-- 3. completion (hrsh7th/nvim-cmp)
local cmp = require("cmp")
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "buffer" },
    { name = "path" },
  },
  mapping = cmp.mapping.preset.insert({
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ['<C-e>'] = cmp.mapping.abort(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
  }),
  experimental = {
    ghost_text = true,
  },
})

--4. lsp settings
local lspconfig = require('lspconfig')
lspconfig.ruby_lsp.setup {
  init_options = {
    formatter = 'syntax_tree',
  },
}
