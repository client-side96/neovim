-- Plugin that improves the native lsp features with linting, formatting, etc.
local nullls = require('null-ls')
local lsp = require('config.lsp.lspconfig')

local b = nullls.builtins


nullls.setup({
  diagnostics_format = "[#{c}] #{m} (#{s})",
  sources = {
    b.code_actions.gitsigns,
    -- JS/TS
    b.formatting.prettier.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "yaml", "graphql", "svelte" }
    }),
    b.diagnostics.eslint.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" }
    }),
    -- Rust
    b.formatting.rustfmt
  },
  on_attach = lsp.on_attach
})

