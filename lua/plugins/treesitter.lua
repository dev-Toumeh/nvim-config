return {
      "nvim-treesitter/nvim-treesitter",
       build = ":TSUpdate",
       config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
        ensure_installed = {"c", "vim", "lua", "sql", "php", "go", "javascript", "html", "yaml", "json", 'cmake'},
 --     sync_install = false,
 --     highlight =
 --     {
 --         enable = true,
 --         disable = {"c", "lua" }
 --     },
        indent = { enable = true }  
        })
       end
}
