return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-telescope/telescope-file-browser.nvim",
		},
		config = function()
			local telescopeUnit = require("plugins.plugin_helpers.telescope-unit")
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", function()
				return telescopeUnit.findFilesConfig()
			end, {})
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "search using grep_files"})
			vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc ="search available buffers"})
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc ="search inside of help tags"})
			vim.keymap.set("n", "<leader>fr", builtin.git_files, {desc ="search only git files"})
			vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {desc ="search old files"})
			vim.keymap.set("n", "<leader>fu" ,builtin.git_status, {desc ="open git status"})
			vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, {desc ="search words inside the current file"})
			vim.keymap.set("n", "<leader>fdd", ":Telescope file_browser<CR>", {desc ="open file_browser"})
			vim.keymap.set("n", "<leader>fdc", ":Telescope file_browser path=%:p:h select_buffer=true<CR>", {desc ="open file_browser with the path of the current buffer"})
		end,
	},
	{ -- this plugin will help display lsp code solutions in better way (space + ca )
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
