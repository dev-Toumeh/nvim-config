return {
    'numToStr/Comment.nvim',
    opts = {
        -- add any options here
    },
    config = require('Comment').setup(
      {
        opleader = {
          ---Line-comment keymap
          line = 'mc',
          ---Block-comment keymap
          block = 'mb',
        },
      }
    ),
    lazy = false
}
