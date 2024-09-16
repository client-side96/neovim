local keymap = require('utils/keymap')

-- ### GENERAL ###

keymap.n_set('<Leader>ws', ':sp<CR>') -- split window horizontally
keymap.n_set('<Leader>wv', ':vsp<CR>') -- split window vertically
keymap.v_set('<', '<gv') -- indent line to the left in visual mode
keymap.v_set('>', '>gv') -- indent line to the right in visual mode
keymap.n_set('ge', 'G') -- move cursor to end of file
keymap.n_set('gl', '$') -- move cursor to end of line
keymap.n_set('gs', '^') -- move cursor to first non empty character of line


-- ### TELESCOPE ###

keymap.n_set('<Leader>*', ':Telescope grep_string theme=ivy <CR>') -- search line in workspace
keymap.v_set('<Leader>*', ':Telescope grep_string theme=ivy <CR>') -- search selection in workspace
keymap.n_set('<Leader>/', ':Telescope live_grep theme=ivy <CR>') -- search workspace for patterns 
keymap.n_set('<Leader>b', ':Telescope buffers <CR>') -- find open buffers in workspace
keymap.n_set('<Leader>D', ':Telescope diagnostics theme=ivy <CR>') -- list diagnostics in workspace
keymap.n_set('<Leader>f', ':Telescope find_files <CR>') -- find files in workspace
keymap.n_set('<Leader>g', ':Neogit <CR>') -- open a git tab
keymap.n_set('<Leader>n', ':Neotree toggle=true <CR>') -- browse files in a tree
keymap.n_set('<Leader>s', ':Telescope lsp_document_symbols theme=ivy <CR>') -- search symbol in file
keymap.n_set('<Leader>S', ':Telescope lsp_dynamic_workspace_symbols theme=ivy <CR>') -- search symbol in workspace
keymap.n_set('gd', ':Telescope lsp_definitions theme=ivy <CR>') -- list symbol definitions
keymap.n_set('gD', ':Telescope lsp_type_definitions theme=ivy <CR>') -- list symbol declarations
keymap.n_set('gi', ':Telescope lsp_implementations theme=ivy <CR>') -- list symbol implementations
keymap.n_set('gr', ':Telescope lsp_references theme=ivy <CR>') -- list symbol references

