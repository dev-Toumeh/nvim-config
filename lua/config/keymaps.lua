local map = vim.keymap.set
local builtin = require("telescope.builtin")
local has_dap, dap = pcall(require, "dap")
  if not has_dap then
    print("Failed to load 'dap'")
    return
end

-- editing the code
map("n", "U", "r<CR><Esc>", { desc = "break the line" })
map("n", "<C-k>", "<Plug>(LineJugglerMoveUp)", {desc = "Move line up"})
map("n", "<C-j>", "<Plug>(LineJugglerMoveDown)", {desc = "Move line down"})

-- LSP shortcuts dhdh
map("n", "gi", require("telescope.builtin").lsp_implementations, { desc = "list all implementaions" })
map("n", "gr", require("telescope.builtin").lsp_references, { desc = "List references" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to the definition" })
map("n", "<leader><leader>n", vim.lsp.buf.rename, { desc = "rename the symbol" })
map({"n", "v"}, "<leader><leader>a", vim.lsp.buf.code_action, { desc = "Show code actions" })
map("n", "<leader><leader>f", vim.lsp.buf.format, { desc = "format if there is none-ls source" })

-- telescope key mapping
vim.keymap.set("n", "<leader>ff", builtin.find_files, {desc = "search files"})
vim.keymap.set("n", "<leader>fg", builtin.live_grep, {desc = "search using grep_files"})
vim.keymap.set("n", "<leader>fb", builtin.buffers, {desc = "search available buffers"})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {desc = "search inside of help tags"})
vim.keymap.set("n", "<leader>fr", builtin.git_files, {desc = "search only git files"})
vim.keymap.set("n", "<leader>fo", builtin.oldfiles, {desc = "search old files"})
vim.keymap.set("n", "<leader>fu", builtin.git_status, {desc = "open git status"})
vim.keymap.set("n", "<leader>fs", builtin.current_buffer_fuzzy_find, {desc = "search words inside the current file"})
vim.keymap.set("n", "<leader>fdd", ":Telescope file_browser<CR>", {desc = "open file_browser"})
vim.keymap.set(
	"n",
	"<leader>fdc",
	":Telescope file_browser path=%:p:h select_buffer=true<CR>",
	{ desc = "open file_browser with the path of the current buffer" }
)

-- debug key maps
vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F13>", dap.restart)

map("n", "<leader><leader>n", vim.lsp.buf.rename, { desc = "rename the symbol" })
map({ "n", "v" }, "<leader><leader>a", vim.lsp.buf.code_action, { desc = "Show code actions" })
