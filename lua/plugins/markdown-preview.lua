-- https://github.com/iamcco/markdown-preview.nvim
-- run :MarkdownPreview to open the preview page in the Browser
-- May need to run build with "Lazy build markdown-preview.nvim"

return {
	"iamcco/markdown-preview.nvim",
	cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
	ft = { "markdown" },
	build = function()
		vim.fn["mkdp#util#install"]()
	end,
}
