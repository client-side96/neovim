local options = { noremap = true, silent = true }

local function set_keymap(mode, combi, cmd)
  return vim.api.nvim_set_keymap(mode, combi, cmd, options)
end

local function n_set(combi, cmd)
  return set_keymap('n', combi, cmd)
end

local function v_set(combi, cmd)
  return set_keymap('v', combi, cmd)
end


return { n_set = n_set, v_set = v_set }
