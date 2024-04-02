vim.cmd([[
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
]])
vim.g.mapleader = " "
vim.opt.number = true -- enable line numbers
vim.wo.relativenumber = true
vim.keymap.set('n', '<Ctrl>#', ':b#', {noremap = true, silent = true})
