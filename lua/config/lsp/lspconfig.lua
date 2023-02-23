local lspconfig = require('lspconfig')
local util = require('lspconfig/util')

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local register_lsp_keymaps = function(bufnr)
  local opts = { noremap=true, silent=true }
  local bufopts = { noremap=true, silent=true, buffer=bufnr }

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  --vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)
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

local stop_if_client_active = function(client, this_client, clashing)
  local active_clients = vim.lsp.get_active_clients()
  if client.name == clashing then
    for _, client_ in pairs(active_clients) do
      if client_.name == this_client then
        client_.stop()
      end
    end
  end
end

local on_attach = function(client, bufnr)
  register_lsp_keymaps(bufnr)
end

local lsp_flags = {}

local handlers = {
  ["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, {
      border = "solid"
    }
  )
}

lspconfig['tsserver'].setup{
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      stop_if_client_active(client, 'tsserver', 'denols')
    end,
    handlers = handlers,
    flags = lsp_flags,
    root_dir = util.root_pattern("package.json")
}

lspconfig['svelte'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    handlers = handlers,
}

lspconfig['gopls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    handlers = handlers,
}

lspconfig['hls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    handlers = handlers,
}

lspconfig['lua_ls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    handlers = handlers,
}

lspconfig['tailwindcss'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    handlers = handlers,
}

lspconfig['rust_analyzer'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    handlers = handlers,
}

lspconfig['denols'].setup{
    on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      stop_if_client_active(client, 'denols', 'tsserver')
    end,
    flags = lsp_flags,
    root_dir = util.root_pattern("deno.jsonc"),
    handlers = handlers,
}

lspconfig['bashls'].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    handlers = handlers,
}


return { on_attach = on_attach }
