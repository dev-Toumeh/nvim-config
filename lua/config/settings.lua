local map = vim.keymap.set

vim.cmd([[
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set spell
set spelllang=en_us

]])

vim.g.mapleader = " "
vim.opt.number = true -- enable line numbers
vim.wo.relativenumber = true
vim.o.clipboard = 'unnamedplus'

-- Remap for dealing with visual line wraps
map("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
map("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- paste over currently selected text without yanking it
map("v", "p", '"_dp')
map("v", "P", '"_dP')

-- window
map("n", "<leader>ws", "<cmd>split<cr>", { desc = "Horizontal split" })
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Vertical split" })
map("n", "<leader>wc", "<cmd>close<cr>", { desc = "Close" })
map("n", "<leader>wm", "<cmd>WindowsMaximize<cr>", { desc = "Maximize" })
map("n", "<leader>wr", "<cmd>wincmd r<cr>", { desc = "rotate down/right" })
map("n", "<leader>wR", "<cmd>wincmd R<cr>", { desc = "rotate up/left" })
map("n", "<leader>wH", "<cmd>wincmd H<cr>", { desc = "Move left" })
map("n", "<leader>wJ", "<cmd>wincmd J<cr>", { desc = "Move down" })
map("n", "<leader>wK", "<cmd>wincmd K<cr>", { desc = "Move up" })
map("n", "<leader>wL", "<cmd>wincmd L<cr>", { desc = "Move right" })
map("n", "<leader>w=", "<cmd>wincmd =<cr>", { desc = "Equalize size" })
map("n", "<leader>wk", "<cmd>resize +5<cr>", { desc = "Up" })
map("n", "<leader>wj", "<cmd>resize -5<cr>", { desc = "Down" })
map("n", "<leader>wh", "<cmd>vertical resize +3<cr>", { desc = "Left" })
map("n", "<leader>wl", "<cmd>vertical resizce -3<cr>", { desc = "Right" })

-- buffers
map("n", "<leader>bD", "<cmd>%bd|e#|bd#<cr>", { desc = "Close all but the current buffer" })

-- check this when you gain more experience
-- move over a closing element in insert mode
-- map("i", "<C-l>", function()
--  return require("utils.functions").escapePair()
--end)


-- save and quit like you used to
map({ "i", "v", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })
map({ "i", "v", "n", "s" }, "<C-q>", ":q!<CR>", { desc = "close file" })

-- new file
map("n", "<leader>fn", "<cmd>enew<cr>", { desc = "New file" })
-- save file
map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save file" })

-- Spelling
map("n", "<leader>zl", "<cmd>Telescope spell_suggest<cr>", { desc = "List corrections" })
map("n", "<leader>zf", "1z=", { desc = "Use first correction" })
map("n", "<leader>zj", "]s", { desc = "Next error" })
map("n", "<leader>zk", "[s", { desc = "Previous error" })
map("n", "<leader>za", "zg", { desc = "Add word" })










