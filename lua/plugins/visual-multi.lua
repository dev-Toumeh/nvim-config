-- Vim-Visual-Multi is a plugin for Vim and Neovim that enhances visual mode selections. It allows you to make
-- multiple cursors and perform simultaneous edits across multiple lines or occurrences of a pattern in a file.
-- This can streamline tasks like editing multiple lines at once or quickly making changes across a document

return {
	"mg979/vim-visual-multi",
	-- See https://github.com/mg979/vim-visual-multi/issues/241
	init = function()
		vim.g.VM_default_mappings = 0
		vim.g.VM_maps = {
			["Find Under"] = "",
		}
		vim.g.VM_add_cursor_at_pos_no_mappings = 1
	end,
}
