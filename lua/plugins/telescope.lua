return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-telescope/telescope-symbols.nvim",
      "nvim-telescope/telescope-ui-select.nvim", -- this plugin will help display lsp code solutions in better way
    },
    config = function()
      require("telescope").setup({
        defaults = {
          file_ignore_patterns = { ".git/", "vendor/", ".idea/", "cache/" },
        },
        -- if you need to add config to pickers uncomment the following
        -- pickers = {
        -- 	find_files = {
        -- 		hidden = true,
        -- 	},
        -- },
        extensions = {
          file_browser = {
            hidden = true,
          },
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("file_browser")
      require("telescope").load_extension("ui-select")
    end,
  },
}
