local K = require('keymap')
local telescope = require('telescope')
local telescopeConfig = require("telescope.config")

-- Clone default Telescope config
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) } 

table.insert(vimgrep_arguments, "--hidden")
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")

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

K.keymap('n', '<Leader>ff', ':Telescope find_files <CR>')
K.keymap('n', '<Leader>fg', ':Telescope live_grep theme=ivy <CR>')
K.keymap('n', '<Leader>*', ':Telescope grep_string theme=ivy <CR>')

K.keymap('n', 'gr', ':Telescope lsp_references theme=ivy <CR>')
K.keymap('n', 'gs', ':Telescope lsp_document_symbols theme=ivy <CR>')
K.keymap('n', 'gi', ':Telescope lsp_implementations theme=ivy <CR>')
K.keymap('n', 'gd', ':Telescope lsp_definitions theme=ivy <CR>')
K.keymap('n', 'gD', ':Telescope lsp_type_definitions theme=ivy <CR>')
K.keymap('n', '<space>e', ':Telescope diagnostics theme=ivy <CR>')


