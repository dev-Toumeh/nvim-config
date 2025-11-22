-- null-ls.nvim is a Neovim plugin that provides an easy way to integrate external tools like linters,
-- formatters, and other code quality tools
-- into Neovim's built-in Language Server Protocol (LSP) client. It allows you to use tools that are not originally built as LSP servers
-- but still perform actions like formatting, diagnostics, and code actions.
-- https://github.com/nvimtools/none-ls.nvim

return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua, -- lua
        null_ls.builtins.formatting.gofumpt, -- go
        null_ls.builtins.formatting.shfmt,  -- sh
        null_ls.builtins.formatting.phpcsfixer, -- php
        null_ls.builtins.formatting.biome,
        null_ls.builtins.formatting.tidy, -- xml, html
        null_ls.builtins.formatting.prettier, -- "javascript" "typescript", "css", "html" + related frameworks like react or vue 
        null_ls.builtins.diagnostics.djlint, --(keywords: django, go, nunjucks, twig, handlebars, mustache, angular, jinja)
        null_ls.builtins.formatting.black, -- python
      }
    })
    vim.keymap.set("n", "<leader><leader>f", vim.lsp.buf.format, { desc = "format if there is none-ls source" })
  end,
}
