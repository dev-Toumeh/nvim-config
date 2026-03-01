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
      local function as_path(target)
        if type(target) == "number" then
          local name = vim.api.nvim_buf_get_name(target)
          if name ~= "" then
            return name
          end
          return vim.fn.getcwd()
        end
        if type(target) == "string" and target ~= "" then
          return target
        end
        return vim.fn.getcwd()
      end

      local function project_root(target)
        local path = as_path(target)
        local git_dir = vim.fs.find({ ".git" }, { path = path, upward = true })[1]
        return git_dir and vim.fs.dirname(git_dir) or vim.fn.getcwd()
      end

      vim.lsp.config("gopls", {
        settings = {
          gopls = {
            buildFlags = { "-tags=dev" },
          },
        },
      })
      vim.lsp.enable("gopls")

      vim.lsp.enable("htmx")
      vim.lsp.enable("pyright")
      vim.lsp.enable("ruff")
      vim.lsp.enable("phpactor")

      vim.lsp.config("intelephense", {
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
      vim.lsp.enable("intelephense")

      vim.lsp.config("jdtls", {
        cmd = { "/home/naseem91/.local/share/nvim/mason/bin/jdtls" },
        root_dir = function(target)
          local path = as_path(target)
          local marker = vim.fs.find({ "gradlew", ".git", "mvnw" }, { path = path, upward = true })[1]
          return marker and vim.fs.dirname(marker) or vim.fn.getcwd()
        end,
      })
      vim.lsp.enable("jdtls")

      vim.lsp.config("lua_ls", {
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
          return project_root(fname)
        end,
      })
      vim.lsp.enable("lua_ls")

      vim.lsp.config("bashls", {
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh" },
        root_dir = function(fname)
          return project_root(fname)
        end,
        single_file_support = true,
        settings = {
          bashIde = {
            globPattern = "*@(.sh|.inc|.bash|.command)",
          },
        },
      })
      vim.lsp.enable("bashls")

      vim.lsp.config("yamlls", {
        cmd = { "yaml-language-server", "--stdio" },
        filetypes = { "yaml", "yaml.docker-compose" },
        root_dir = function(fname)
          return project_root(fname)
        end,
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
      vim.lsp.enable("yamlls")

      vim.lsp.enable("cssmodules_ls") -- work within js/ts files where you are importing CSS modules.
      vim.lsp.enable("css_variables")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      vim.lsp.config("cssls", {
        capabilities = capabilities,
      })
      vim.lsp.enable("cssls")
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
