return
  {
    	'nvim-telescope/telescope.nvim', tag = '0.1.5',
       dependencies = { 'nvim-lua/plenary.nvim',
                        'nvim-telescope/telescope.nvim',
                        'nvim-telescope/telescope-file-browser.nvim'
                      },
      config = function()
        local builtin = require("telescope.builtin")
      -- keymap for telescope
        vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fr', "<cmd>lua require('telescope').extensions.file_browser.file_browser({hidden = true})<CR>", {noremap = true, silent = true})
      end  
  }

