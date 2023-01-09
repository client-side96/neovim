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
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "yaml", "graphql", "svelte" },
      condition = function(utils)
        -- not for deno projects
        return not utils.root_has_file "deno.jsonc"
      end,
    }),
    b.formatting.deno_fmt,
    b.diagnostics.eslint.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
      condition = function(utils)
        -- not for deno projects
        return not utils.root_has_file "deno.jsonc"
      end,
    }),
    -- Rust
    b.formatting.rustfmt
  },
  on_attach = lsp.on_attach
})

