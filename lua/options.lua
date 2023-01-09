local set = vim.opt
local let = vim.g
local cmd = vim.cmd

-- General
let.mapleader = ','

-- Color scheming
set.termguicolors = true
set.background = 'dark'
set.encoding = 'utf-8'
set.fileencoding = 'utf-8'
set.showmode = false -- hide current mode like --INSERT--
cmd('colorscheme gruvbox') -- set color scheme

-- Cursor
set.mouse = 'a' -- enable using the mouse
set.ruler = true -- show cursor position always
set.cursorline = true -- highlights the current line

-- Splitting and tabs
set.splitbelow = true -- horizonal splits will automatically be below
set.splitright = true -- vertical splits will automatically be to the right
set.showtabline = 2 -- always show tabs
set.hidden = true -- required to keep multiple buffers open
set.pumheight = 10 -- makes popup menu smaller

-- Editor content
set.number = true -- show line numbers
set.relativenumber = true
set.conceallevel = 0 -- to see backticks in markdown files
set.wrap = false -- display long lines as just one line
-- set.list = true -- enable list characters
set.laststatus = 2 -- show status bar
vim.o.completeopt = 'menuone,noselect'

-- White spaces
set.smarttab = true -- makes tabbing smarter
set.expandtab = true -- converts tabs to spaces
set.tabstop = 2 -- insert 2 spaces for a tab
set.shiftwidth = 2 -- number of space characters inserted for indentation
set.smartindent = true -- makes indenting smarter
set.autoindent = true -- good auto indenting

-- Performance
set.updatetime = 300 -- faster completion
set.timeoutlen = 500 -- default is 1000

-- Netrw
let.loaded_netrw = 1 -- disable netrw on startup
let.loaded_netrwPlugin = 1

