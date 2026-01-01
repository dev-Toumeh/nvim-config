--  LSP plugin enriches Neovim with deep language understanding and tools to help manage code
--  for example:
--   * Syntax checking: Highlights syntax errors as you type.
--   * Go-to-definition: Allows you to jump to the definition of a function or variable.
--   * Code formatting: Automatically formats your code according to specified standards.
--
--   available Servers  https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "mfussenegger/nvim-jdtls",
    },
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.gopls.setup({
        settings = {
          gopls = {
            buildFlags = { "-tags=dev" },
          },
        },
      })
      lspconfig.htmx.setup({})
      lspconfig.pyright.setup({})
      lspconfig.ruff.setup({})
      lspconfig.phpactor.setup({})
      lspconfig.intelephense.setup({
        settings = {
          intelephense = {
            diagnostics = { enable = true },
            files = { maxSize = 10000000 },
            stubs = {
              "wordpress", "woocommerce", "acf-pro", "wordpress-globals", "wp-cli", "genesis", "polylang", "sbi",
              "bcmath", "bz2", "calendar", "Core", "curl", "date", "dba", "dom", "enchant", "fileinfo", "filter",
              "ftp", "gd", "gettext", "hash", "iconv", "imap", "intl", "json", "ldap", "libxml", "mbstring",
              "mcrypt", "mysql", "mysqli", "password", "pcntl", "pcre", "PDO", "pdo_mysql", "Phar", "readline",
              "recode", "Reflection", "regex", "session", "SimpleXML", "soap", "sockets", "sodium", "SPL",
              "standard", "superglobals", "sysvsem", "sysvshm", "tokenizer", "xml", "xdebug", "xmlreader",
              "xmlwriter", "yaml", "zip", "zlib"
            }
          }
        }
      })
      lspconfig.jdtls.setup({
        cmd = { "/home/naseem91/.local/share/nvim/mason/bin/jdtls" },
        root_dir = function()
          return vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1])
        end,
      })
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
      lspconfig.cssmodules_ls.setup({}) -- work within js/ts files where you are importing CSS modules.
      lspconfig.css_variables.setup({})
      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig.cssls.setup({
        capabilities = capabilities,
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  -- Mason dwnloads & installs the servers automatically.
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",        -- bash-language-server
          "cssls",         -- css-lsp
          "cssmodules_ls", -- css-language-server
          "css_variables", -- css-variables-language-server
          "gopls",         -- golang
          "lua_ls",        -- lua-language-server
          "phpactor",      -- php
          "rust_analyzer", -- rust-analyzer
          "tailwindcss",   -- tailwindcss-language-server
          "yamlls",        -- yaml
          "marksman",      -- Markdown
          "pyright",       -- python
          "ruff"           -- python
        },
      })
    end,
  },
}
