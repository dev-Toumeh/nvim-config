local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")

require("telescope").load_extension "file_browser"

local configs = require("nvim-treesitter.configs")
      configs.setup({
      ensure_installed = {"c", "vim", "lua", "sql", "php", "go", "javascript", "html", "yaml", "json", 'cmake'},
      sync_install = false,
 --     highlight =
 --     {
 --         enable = true,
 --         disable = {"c", "lua" }
 --     },
      indent = { enable = true }  
        })

require('config.settings')              -- General settings
require('config.keymaps')               -- Key mappings, now safe to include Telescope mappings
require('themes.catppuccin')            -- Theme setup
