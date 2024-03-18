return {

  {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies =
       {
         "nvim-lua/plenary.nvim",
         "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
         "MunifTanjim/nui.nvim",
         -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
       }
  },
  {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
}
}


