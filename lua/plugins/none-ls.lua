return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- lua
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
				null_ls.builtins.formatting.golines, -- go
				null_ls.builtins.formatting.shfmt, -- sh 
        null_ls.builtins.formatting.prettier, -- "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "css", "scss", "less", "html"
        null_ls.builtins.diagnostics.djlint   --(keywords: django, go, nunjucks, twig, handlebars, mustache, angular, jinja)

			},
		})
		vim.keymap.set("n", "mf", vim.lsp.buf.format, { desc = "format if there is none-ls source"})
	end,
}
