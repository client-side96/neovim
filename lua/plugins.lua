local packer = require('packer')

return packer.startup(function()

  -- Themes
  use 'haishanh/night-owl.vim'
  use 'ful1e5/onedark.nvim'
  use 'ellisonleao/gruvbox.nvim'
  use 'marko-cerovac/material.nvim'

  -- Icons
  use 'nvim-tree/nvim-web-devicons'

  -- File finders
  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { {'nvim-lua/plenary.nvim'} },
    config = function()
      require('config.telescope')
    end
  }

  -- File explorer
  use {
    'nvim-tree/nvim-tree.lua',
    config = function ()
      require('config.tree')
    end
  }

  -- Status line
  use {
    'nvim-lualine/lualine.nvim',
    config = function()
      require('config.lualine')
    end
  }

  -- Tab line
  use {
    'kdheepak/tabline.nvim',
    config = function()
      require('config.tabline')
    end
  }

  -- Syntax highlighting
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
    end,
    config = function()
      require('config.treesitter')
    end
  }

  -- Language server integration
  use {
    'neovim/nvim-lspconfig',
    config = function()
      require('config.lsp.lspconfig')
    end
  }

  -- Language features (Linting & Formatting)
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = {"nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
    config = function()
      require('config.lsp.nullls')
    end
  }

  -- Autocompletion
  use {
    'hrsh7th/nvim-cmp',
    requires = {'onsails/lspkind-nvim'},
    config = function()
      require('config.cmp')
    end

  }
  use {'hrsh7th/cmp-nvim-lsp'}
  use {'hrsh7th/cmp-buffer'}
  use {'hrsh7th/cmp-vsnip'}
  use {'hrsh7th/cmp-path'}
  use {'hrsh7th/vim-vsnip'}

  -- Autoclosing brackets and parentheses
  use {
	"windwp/nvim-autopairs",
  config = function()
    require("config.autopairs")
  end
}

  -- Commenting code
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('config.comment')
    end
  }

  -- Surrounding
  use({
    "kylechui/nvim-surround",
    tag = "*", -- Use for stability; omit to use `main` branch for the latest features
    config = function()
        require("config.surround")
    end
})

  -- Git integration
  use {
    'lewis6991/gitsigns.nvim',
  -- tag = 'release' -- To use the latest release (do not use this if you run Neovim nightly or dev builds!)
    config = function ()
      require('config.gitsigns')
    end
  }

  -- Session Management

  -- Debug Tools

  -- Terminal
  use({ 
    "akinsho/toggleterm.nvim",
    tag = '*',
    config = function()
      require("config.toggleterm")
    end
  })
end)



