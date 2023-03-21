local cmd = vim.cmd
local let = vim.g

-- General
let.mapleader = ','

require('plugins') -- external plugins installed via packer

cmd('colorscheme rose-pine') -- set color scheme
require('options') -- global neovim options and configurations

require('keymap') -- custom key mappings
