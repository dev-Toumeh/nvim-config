--  LSP plugin enriches Neovim with deep language understanding and tools to help manage code
--  for example:
--   * Syntax checking: Highlights syntax errors as you type.
--   * Go-to-definition: Allows you to jump to the definition of a function or variable.
--   * Code formatting: Automatically formats your code according to specified standards.

return
{
  {
    "neovim/nvim-lspconfig",
      config = function()
        local lspconfig = require("lspconfig")
        lspconfig.lua_ls.setup({})
        lspconfig.gopls.setup{}
        lspconfig.phpactor.setup{}
        lspconfig.bashls.setup{
          cmd = { "bash-language-server", "start" },
          filetypes = { "sh" },
          root_dir = lspconfig.util.find_git_ancestor,
          single_file_support = true,
          settings = {
            bashIde = {
              globPattern = "*@(.sh|.inc|.bash|.command)"
            }
          }
        }
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
        vim.keymap.set('n', '<leader>ln', vim.lsp.buf.rename, {desc = "rename the symbol"})
        vim.keymap.set('n', '<leader>lk', vim.lsp.buf.hover, {desc = "Show hover information"})
        vim.keymap.set('n', '<leader>ld', vim.lsp.buf.definition, {desc = "Go to definition"})
        vim.keymap.set({ 'n', 'v' }, '<leader>lc', vim.lsp.buf.code_action, {desc = "Show code actions"})
        vim.keymap.set('n', '<leader>lr', require('telescope.builtin').lsp_references, {desc = "List references with Telescope"})
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
      ensure_installed = { "lua_ls", "gopls", "phpactor", "yamlls", "bashls"},
      }
    end
  }
}
