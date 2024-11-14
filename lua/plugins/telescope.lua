return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
			"nvim-telescope/telescope-symbols.nvim",
      -- this plugin will help display lsp code solutions in better way
			"nvim-telescope/telescope-ui-select.nvim",
		},
		config = function()
local builtin = require("telescope.builtin")
			require("telescope").setup({
				defaults = {
					layout_strategy = "vertical",
					layout_config = {
						height = 0.8,
						width = 0.8,
						preview_cutoff = 0,
					},
				},

				pickers = {
					lsp_references = {
						previewer = true,
						path_display = {"tail"},
					},
					-- 	find_files = {
					--
					-- 		hidden = true,
					-- 	},
				},
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

      vim.keymap.set("n", "gi", builtin.lsp_implementations, { desc = "list all implementaions" })
      vim.keymap.set("n", "gr", builtin.lsp_references, { desc = "List references" })
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "search files" })
      vim.keymap.set("n", "<leader>fl", builtin.resume, { desc = "open the last search" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "search using grep_files" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "search available buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "search inside of help tags" })
      vim.keymap.set("n", "<leader>fr", builtin.git_files, { desc = "search only git files" })
      vim.keymap.set("n", "<leader>fc", builtin.git_bcommits, { desc = " list all the commits of the current file" })
      vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "search old files" })
      vim.keymap.set("n", "<leader>fu", builtin.git_status, { desc = "open git status" })
      vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "search words inside the current file" })
      vim.keymap.set("n", "<leader>fdd", ":Telescope file_browser<CR>", { desc = "open file_browser" })

      vim.keymap.set( "n", "<leader>fdc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { desc = "open file_browser with the path of the current buffer" })
      vim.keymap.set("n", "<leader>ft", function() require("telescope.builtin").lsp_document_symbols({
        symbols = { "Function" } })
      end, { desc = "LSP function and method only" })
		end,

	},

}
