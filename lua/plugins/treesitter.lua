-- https://github.com/nvim-treesitter/nvim-treesitter

return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		-- To highlight the lines between the start and end of an element
	--	"p00f/nvim-ts-rainbow",
	},
	build = ":TSUpdate",
	config = function()
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			auto_install = true,
			ensure_installed = { "c", "vim", "lua", "sql", "php", "go", "javascript", "html", "yaml", "json", "cmake", "java" },
			modules = {},
			sync_install = false,
			ignore_install = {},
			highlight = {
				enable = true,
				disable = { "c", "lua" },
			},
			indent = { enable = true },
			-- rainbow = {
			-- 	enable = true,
			-- 	extended_mode = true, -- Highlight also non-bracket delimiters like HTML tags, boolean or table: lang -> boolean
			-- 	max_file_lines = nil, -- Do not enable for files with more than n lines, int
			-- },
		})
	end,
}
