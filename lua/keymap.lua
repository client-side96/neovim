local options = { noremap = true, silent = true }

local function keymap(mode, combi, cmd)
  return vim.api.nvim_set_keymap(mode, combi, cmd, options)
end

-- buffers
keymap('n', '<Leader>ws', ':sp<CR>') -- split horizontally
keymap('n', '<Leader>wv', ':vsp<CR>') -- split vertically

-- Helix
keymap('n', 'ge', 'G') -- move to end of file
keymap('n', 'gs', '^') -- move to first non zero char of lin
keymap('n', 'gl', '$') -- move to end of line

-- indentation in visual mode
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

return { keymap = keymap }



