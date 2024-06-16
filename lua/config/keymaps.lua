local map = vim.keymap.set
local telescopeUnit = require("plugins.plugin_helpers.telescope-unit")
local builtin = require("telescope.builtin")


-- editing the code
map("n", "U", "r<CR><Esc>", { desc = "break the line" })

-- LSP shortcuts 
--map("n", "gd", vim.lsp.buf.definition, { desc = "Go to the definition" })
map("n", "gr",	require("telescope.builtin").lsp_references,	{ desc = "List references"})
map("n", "<gi",	require("telescope.builtin").lsp_implementations	,	{ desc = "list all implementaions"})
map('n', '<leader>lr', vim.lsp.buf.rename, {desc = "rename the symbol"})
map({ 'n', 'v' }, '<leader>lc', vim.lsp.buf.code_action, {desc = "Show code actions"})

-- telescope key mapping
vim.keymap.set("n", "<leader>ff", function()
	return telescopeUnit.findFilesConfig()
end, {})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "search using grep_files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "search available buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "search inside of help tags" })
vim.keymap.set("n", "<leader>fr", builtin.git_files, { desc = "search only git files" })
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, { desc = "search old files" })
vim.keymap.set("n", "<leader>fu", builtin.git_status, { desc = "open git status" })
vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, { desc = "search words inside the current file" })
vim.keymap.set("n", "<leader>fdd", ":Telescope file_browser<CR>", { desc = "open file_browser" })
vim.keymap.set(
	"n",
	"<leader>fdc",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ desc = "open file_browser with the path of the current buffer" }
)
