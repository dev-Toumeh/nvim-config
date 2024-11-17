 -- General settings
require('config.settings')

 -- lazyload config
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

-- Automatically reload the file if it was changed outside of nvim
vim.api.nvim_create_autocmd({"FocusGained", "BufEnter"}, {
    command = "checktime"
})

vim.opt.rtp:prepend(lazypath)
require("lazy").setup("plugins")

 -- key mapping
require('config.keymaps')

