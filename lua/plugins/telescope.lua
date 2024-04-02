return
  {
    {
      'nvim-telescope/telescope.nvim', tag = '0.1.5',
       dependencies = { 'nvim-lua/plenary.nvim',
                        'nvim-telescope/telescope.nvim',
                        'nvim-telescope/telescope-file-browser.nvim'
                      },
      config =
      function()
        local builtin = require("telescope.builtin")
        vim.keymap.set('n', '<leader>ff',
        function()  
          builtin.find_files({
              hidden = true,
              file_ignore_patterns = {"%.git/", "%vendor/", "%.idea/", "%cache/"}
            })
        end, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
        vim.keymap.set('n', '<leader>fr', "<cmd>lua require('telescope').extensions.file_browser.file_browser({hidden = true})<CR>", {noremap = true, silent = true})
      end
    },
    { -- this plugin will help display lsp code solutions in better way (space + ca )
     "nvim-telescope/telescope-ui-select.nvim",
      config = function()
      require("telescope").setup({
        extensions = {
            ["ui-select"] = {
              require("telescope.themes").get_dropdown {
                  }
              }
         }
      })
      require("telescope").load_extension("ui-select")
      end
    }
  }

