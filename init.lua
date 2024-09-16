local lazy_config = require('config.lazy')

lazy_config.init()

-- General
vim.g.mapleader = ' '


require('options') -- global neovim options and configurations


lazy_config.setup()

vim.cmd('colorscheme kanagawa') -- set color scheme

require('keybindings') -- custom key mappings
