return {
  {
   'kdheepak/tabline.nvim',
   config = function()
     require('config.tabline')
   end
  },
  {
   'nvim-lualine/lualine.nvim',
   config = function()
     require('config.lualine')
   end
  },
}
