return
{
  {
    "neovim/nvim-lspconfig",
      config = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({})
        lspconfig.gopls.setup{}
        lspconfig.phpactor.setup{}
        lspconfig.yamlls.setup{
          cmd = {"yaml-language-server", "--stdio"},
          filetypes = {"yaml", "yaml.docker-compose"},
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
      }
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
        vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
      end
   },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
   "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup {
      ensure_installed = { "lua_ls", "gopls", "phpactor", "yamlls"},
      }
    end
  }
}
