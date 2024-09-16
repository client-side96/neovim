local telescope = require('telescope')

telescope.setup {
  defaults = {
    selection_strategy = 'follow',
    file_ignore_patterns = { "node_modules", "dist" },
    vimgrep_arguments = vimgrep_arguments,
  },
  pickers = {
    find_files = {
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*"},
      theme = "dropdown",
      preview = {
        hide_on_startup = true,
      },
    }
  },
  extensions = {}
}



