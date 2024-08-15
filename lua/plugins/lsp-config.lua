--  LSP plugin enriches Neovim with deep language understanding and tools to help manage code
--  for example:
--   * Syntax checking: Highlights syntax errors as you type.
--   * Go-to-definition: Allows you to jump to the definition of a function or variable.
--   * Code formatting: Automatically formats your code according to specified standards.

return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
        root_dir = function(fname)
          return require("lspconfig").util.find_git_ancestor(fname) or vim.fn.getcwd()
        end,
      })
      lspconfig.gopls.setup({})
      lspconfig.phpactor.setup({})
      lspconfig.bashls.setup({
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh" },
        root_dir = lspconfig.util.find_git_ancestor,
        single_file_support = true,
        settings = {
          bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command)",
          },
        },
      })
      lspconfig.yamlls.setup({
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yaml.docker-compose" },
        root_dir = lspconfig.util.find_git_ancestor,
        settings = {
          yaml = {
            schemas = {
              ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
              "/home/naseem91/PhpstormProjects/php-dockerCompose-devstack",
            },
          },
          redhat = {
            telemetry = {
              enabled = false,
            },
          },
        },
        single_file_support = true,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "gopls", "phpactor", "yamlls", "bashls" },
      })
    end,
  },
}
