-- A modern Neovim plugin that improves matching pairs navigation 
-- (e.g., <div>...</div>, {...}, if...end). It enhances % movement,
-- highlights m-- atching elements, and supports Treesitter for better accuracy. 
-- https://github.com/andymass/vim-matchup
return {
  "andymass/vim-matchup",
  config = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
