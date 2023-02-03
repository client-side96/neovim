local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local opts = { noremap=true, silent=true }

--vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<Leader>r', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<space>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {}

lspconfig['tsserver'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = util.root_pattern("package.json")
}

lspconfig['svelte'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig['hls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig['sumneko_lua'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig['tailwindcss'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}

lspconfig['denols'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = util.root_pattern("deno.jsonc")
}

return { on_attach = on_attach }
