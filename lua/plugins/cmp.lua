-- CMP plugin focuses on improving how quickly and effectively you can write code by providing intelligent text completion suggestions.
-- This plugin pulls in suggestions from various sources including:
--  * Language server: Suggests code completions based on language syntax and semantics.
--  * Snippets: Offers reusable code snippets for quick insertion.
--  * Buffer words: Suggests words from the current document for completion.

return {
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},
				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<CR>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),
				sources = cmp.config.sources({
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
					{ name = "buffer", keyword_length = 4 },
					{ name = "path" },
				}),
				experimental = {
					ghost_text = true,
				}
			})

      -- Register an event handler to automatically insert matching characters (e.g., parentheses)
      -- after confirming a completion item, which helps with auto-pairs functionality.
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
}
