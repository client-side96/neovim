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

  -- File explorer
   {
    'nvim-tree/nvim-tree.lua',
    config = function ()
      require('config.tree')
    end
   },

  -- Status line
   {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine')
    end
   },

  -- Tab line
   {
    'kdheepak/tabline.nvim',
    config = function()
      require('config.tabline')
    end
   },

  -- Syntax highlighting
   {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate",
    config = function()
      require('config.treesitter')
    end
  },

  -- Language server integration
   {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp.lspconfig')
    end
  },

  -- Language features (Linting & Formatting)
   {
    'jose-elias-alvarez/null-ls.nvim',
    dependencies = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
    config = function()
      require('config.lsp.nullls')
    end
  },

  -- Autocompletion
   {
    'hrsh7th/nvim-cmp',
    dependencies = {'onsails/lspkind-nvim'},
    config = function()
      require('config.cmp')
    end

  },
   {'hrsh7th/cmp-nvim-lsp'},
   {'hrsh7th/cmp-buffer'},
   {'hrsh7th/cmp-vsnip'},
   {'hrsh7th/cmp-path'},
   {'hrsh7th/vim-vsnip'},

  -- Autoclosing brackets and parentheses
   {
	"windwp/nvim-autopairs",
  config = function()
    require("config.autopairs")
  end
},

  -- Commenting code
   {
    'numToStr/Comment.nvim',
    config = function()
        require('config.comment')
    end
  },

  -- Surrounding
  {
    "kylechui/nvim-surround",
    --tag = "*", -- Use for stability; omit to  `main` branch for the latest features
    config = function()
        require("config.surround")
    end
},

  -- Git integration
   {
    'lewis6991/gitsigns.nvim',
  -- tag = 'release' -- To  the latest release (do not use this if you run Neovim nightly or dev builds!)
    config = function ()
      require('config.gitsigns')
    end
  },

  -- Session Management

  -- Debug Tools

  -- Terminal
  { 
    "akinsho/toggleterm.nvim",
    --tag = '*',
    config = function()
      require("config.toggleterm")
    end
  }
}

local opts = {}

require("lazy").setup(plugins, opts)

