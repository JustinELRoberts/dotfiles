return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		lazy = false,
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter").install({
				"bash",
				"css",
				"dockerfile",
				"html",
				"javascript",
				"jsdoc",
				"json",
				"luadoc",
				"python",
				"regex",
				"rust",
				"svelte",
				"toml",
				"tsx",
				"typescript",
				"yaml",
			})

			-- Start Treesitter highlighting for any filetype that has a parser
			vim.api.nvim_create_autocmd("FileType", {
				callback = function(args)
					pcall(vim.treesitter.start, args.buf)
				end,
			})
		end,
	},
}
