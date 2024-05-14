-- nvim-autopairs is a Neovim plugin that helps with automatically closing pairs of 
-- characters, such as parentheses, brackets, and quotes, while writing code. 

return {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equalent to setup({}) function
}
