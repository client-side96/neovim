-- Plugin that improves the native lsp features with linting, formatting, etc.
local nullls = require('null-ls')
local lsp = require('config.lsp.lspconfig')

local b = nullls.builtins


nullls.setup({
  diagnostics_format = "[#{c}] #{m} (#{s})",
  sources = {
    b.code_actions.gitsigns,
    -- JS/TS
    b.formatting.prettierd.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html", "json", "yaml", "graphql", "svelte" },
    }),
    b.formatting.deno_fmt.with({
      condition = function(utils)
        -- not for deno projects
        return not utils.root_has_file "package.json"
      end,
    }),
    b.diagnostics.eslint.with({
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
      condition = function(utils)
        -- not for deno projects
        return not utils.root_has_file "deno.jsonc"
      end,
    }),
    -- Rust
    b.formatting.rustfmt,
    -- Haskell
    b.formatting.stylish_haskell,
  },
  on_attach = lsp.on_attach
})

