local options = { noremap = true, silent = true }

local function keymap(mode, combi, cmd)
  return vim.api.nvim_set_keymap(mode, combi, cmd, options)
end

-- tabs
keymap('n', '<Leader>t', ':TablineTabNew<CR>') -- open new tab
keymap('n', '<Leader>w', ':bw<CR>') -- close new tab
keymap('n', '<Leader><Tab>', ':TablineBufferNext<CR>') -- move to next tab

-- buffers
keymap('n', '<Leader>bb', ':sp<CR>') -- split horizontally
keymap('n', '<Leader>vv', ':vsp<CR>') -- split vertically

keymap('n', '<Leader>n', ':Neotree toggle right<CR>')

-- indentation in visual mode
keymap('v', '<', '<gv')
keymap('v', '>', '>gv')

return { keymap = keymap }



