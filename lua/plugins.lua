return {
	{
	    "catppuccin/nvim", name = "catppuccin", priority = 1000
	},
	{
    	'nvim-telescope/telescope.nvim', tag = '0.1.5',
      dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim', 'nvim-telescope/telescope-file-browser.nvim' }
  },
	{
      "nvim-treesitter/nvim-treesitter", build = ":TSUpdate"
  },
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


