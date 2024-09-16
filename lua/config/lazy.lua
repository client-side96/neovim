local lazy_config = {}

function lazy_config.init()
  local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
  if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      lazypath,
    })
  end
  vim.opt.rtp:prepend(lazypath)
end

function lazy_config.setup()
  require('lazy').setup({
    spec = {
      -- import your plugins
      { import = "plugins" },
    },
    -- Configure any other settings here. See the documentation for more details.
    -- colorscheme that will be used when installing plugins.
    install = { colorscheme = { "habamax" } },
    -- automatically check for plugin updates
    checker = { enabled = true },
  })
end

local opts = {}

local plugins = {
  -- Themes
  { "rose-pine/neovim", name = "rose-pine" },

  -- Icons
   'nvim-tree/nvim-web-devicons',

  -- File finders
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('config.telescope')
    end
  },
}

return lazy_config
