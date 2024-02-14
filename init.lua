-- General
vim.g.mapleader = ' '

require('plugins') -- external plugins installed via packer

vim.cmd('colorscheme rose-pine-moon') -- set color scheme
require('options') -- global neovim options and configurations

require('keymap') -- custom key mappings
