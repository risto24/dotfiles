-- ----------------------------------------------------------
-- 導入プラグイン
-- ----------------------------------------------------------
vim.cmd [[
  call plug#begin('~/.config/nvim/plugged')
  Plug 'airblade/vim-gitgutter'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'itchyny/lightline.vim'
  Plug 'Yggdroot/indentLine'
  Plug 'bronson/vim-trailing-whitespace'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'lambdalisue/fern.vim'
  Plug 'lambdalisue/fern-hijack.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  call plug#end()
]]

-- ----------------------------------------------------------
-- 基本設定
-- ----------------------------------------------------------
vim.o.encoding = 'utf-8'
vim.scriptencoding = 'utf-8'
vim.o.backup = false
vim.o.swapfile = false
vim.o.errorbells = false
vim.o.visualbell = true
vim.o.splitright = true
vim.cmd [[
  filetype plugin on
  let g:netrw_liststyle = 3
  let g:netrw_banner = 0
  let g:netrw_preview = 1
]]
vim.opt.clipboard = 'unnamedplus'
vim.opt.visualbell = true
vim.o.mouse = 'a'
vim.cmd [[
  highlight link EndOfBuffer Ignore
  set autoread
  set laststatus=3
]]

-- ----------------------------------------------------------
-- clipboard
-- ----------------------------------------------------------
vim.o.clipboard = 'unnamedplus'

-- ----------------------------------------------------------
-- 文字
-- ----------------------------------------------------------
vim.o.fileencoding = 'utf-8'
vim.o.fileencodings = 'ucs-boms,utf-8,euc-jp,cp932'
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
vim.api.nvim_set_keymap('t', '<Esc>', '<C-w><S-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-j>', '<C-w>g<S-t>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<C-k>', '<C-w>gt', { noremap = true, silent = true })
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
vim.o.number = true
vim.o.backspace = 'indent,eol,start'
vim.cmd [[let &t_EI .= "\e[1 q"]]

-- ----------------------------------------------------------
-- タブページ
-- ----------------------------------------------------------
vim.o.laststatus = 2
vim.o.showmode = true
vim.o.showcmd = true
vim.o.ruler = true

-- ----------------------------------------------------------
-- コマンドモード
-- ----------------------------------------------------------
vim.o.wildmenu = true
vim.o.history = 5000

-- ----------------------------------------------------------
-- タブ・インデント
-- ----------------------------------------------------------
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.smartindent = true

-- ----------------------------------------------------------
-- 文字列検索
-- ----------------------------------------------------------
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true

-- ----------------------------------------------------------
-- indentLine
-- ----------------------------------------------------------
vim.g.indentLine_char = '¦'

-- ----------------------------------------------------------
-- fzf
-- ----------------------------------------------------------
vim.g.fzf_layout = { window = { width = 0.7, height = 0.6 } }
vim.cmd [[
  command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, {'options': ['--layout=reverse', '--info=inline', '--preview', '~/.vim/plugged/fzf.vim/bin/preview.sh {}']}, <bang>0)
]]

-- ----------------------------------------------------------
-- lightline
-- ----------------------------------------------------------
vim.g.lightline = {
  mode_map = { c = 'NORMAL' },
  active = {
    left = { { 'mode', 'paste' }, { 'fugitive' }, { 'filepath' } },
  },
  component_function = {
    modified = 'LightlineModified',
    readonly = 'LightlineReadonly',
    fugitive = 'LightlineFugitive',
    filepath = 'LightlineFilePath',
    fileformat = 'LightlineFileformat',
    filetype = 'LightlineFiletype',
    fileencoding = 'LightlineFileencoding',
    mode = 'LightlineMode',
  },
}

function _G.LightlineModified()
  return vim.bo.modified and '+' or vim.bo.modifiable and '' or '-'
end

function _G.LightlineReadonly()
  return vim.bo.readonly and 'x' or ''
end

function _G.LightlineFilePath()
  return vim.fn.winwidth(0) > 90 and vim.fn.expand('%:p') or vim.fn.expand('%:t')
end

function _G.LightlineFugitive()
  return vim.fn.exists('*fugitive#head') == 1 and vim.fn['fugitive#head']() or ''
end

function _G.LightlineFileformat()
  return vim.fn.winwidth(0) > 70 and vim.o.fileformat or ''
end

function _G.LightlineFiletype()
  return vim.fn.winwidth(0) > 70 and vim.bo.filetype or ''
end

function _G.LightlineFileencoding()
  return vim.fn.winwidth(0) > 70 and (vim.bo.fenc ~= '' and vim.bo.fenc or vim.o.enc) or ''
end

function _G.LightlineMode()
  return vim.fn.winwidth(0) > 60 and vim.fn['lightline#mode']() or ''
end

-- ----------------------------------------------------------
-- Fern
-- ----------------------------------------------------------
vim.api.nvim_set_keymap('n', '<Leader>.', ':Fern . -drawer -width=35 -toggle<CR><C-w>=', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<down>', ':Fern . -reveal=% -drawer -toggle -width=40<CR>', { noremap = true, silent = true })
vim.g.fern_default_hidden = 1

-- ----------------------------------------------------------
-- coc.nvim
-- ----------------------------------------------------------
vim.api.nvim_set_keymap('n', 'K', ':lua _G.show_documentation()<CR>', { noremap = true, silent = true })

function _G.show_documentation()
  if vim.tbl_contains({ 'vim', 'help' }, vim.bo.filetype) then
    vim.cmd('h ' .. vim.fn.expand('<cword>'))
  elseif vim.fn['coc#rpc#ready']() then
    vim.fn['CocActionAsync']('doHover')
  end
end

vim.cmd [[highlight CocErrorFloat ctermfg=196]]

-- ----------------------------------------------------------
-- tree-sitter
-- ----------------------------------------------------------
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  highlight = {
    enable = true,
    disable = {},
  },
}

