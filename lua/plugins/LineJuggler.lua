-- This plugin offers mappings to quickly duplicate and move lines to above /
-- below the current line. A [count] either specifies the number of lines, or the
-- relative visible target line, therefore it's especially easy to clone lines
-- when 'relativenumber' is set.
-- https://github.com/inkarkat/vim-LineJuggler

return {
	{
		"inkarkat/vim-LineJuggler",
		dependencies = {
			"inkarkat/vim-ingo-library",
			"tpope/vim-repeat",
			"inkarkat/vim-visualrepeat",
		},
	},
  {
    "othree/html5.vim",
    "lumiliet/vim-twig"
  }
}
