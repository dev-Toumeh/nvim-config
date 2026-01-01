local map = vim.keymap.set
local has_dap, dap = pcall(require, "dap")
if not has_dap then
	print("Failed to load 'dap'")
	return
end

-- editing the code
map("n", "<C-k>", "<Plug>(LineJugglerMoveUp)", { desc = "Move line up" })
map("n", "<C-j>", "<Plug>(LineJugglerMoveDown)", { desc = "Move line down" })
map("n", "<C-y>j", "o<Esc>", { desc = "insert empty line after the Corsur" })
map("n", "<C-y>k", "O<Esc>", { desc = "insert empty line before the Corsur" })
map("n", "P", '"+p', { desc = "Past yanked test" })

-- LSP shortcuts
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to the definition" })

-- debug key maps
vim.keymap.set("n", "<space>gb", dap.run_to_cursor)
vim.keymap.set("n", "<F1>", dap.continue)
vim.keymap.set("n", "<space>b", dap.toggle_breakpoint)
vim.keymap.set("n", "<F2>", dap.step_into)
vim.keymap.set("n", "<F3>", dap.step_over)
vim.keymap.set("n", "<F4>", dap.step_out)
vim.keymap.set("n", "<F5>", dap.step_back)
vim.keymap.set("n", "<F13>", dap.restart)

map("n", "<leader><leader>n", vim.lsp.buf.rename, { desc = "rename the symbol" })
map({ "n", "v" }, "<leader><leader>a", vim.lsp.buf.code_action, { desc = "Show code actions" })
map("n", "<C-y>t", ":tabnew<CR>", { noremap = true, silent = true, desc = "Open a new tab" })

-- markdown preview
-- map("n", "<C-s>","<Plug>(MarkdownPreview)")
-- map("n", "<M-s>","<Plug>(MarkdownPreviewStop)")
-- map("n", "<C-p>","<Plug>(MarkdownPreviewToggle)")
