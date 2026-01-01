return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "ruff", "black" },
					rust = { "rustfmt" },
					javascript = { "prettier" },
				},
				format_after_save = {
					async = true,
					timeout_ms = 1000,
					lsp_format = "fallback",
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			ensure_installed = {
				"bashls",
				"lua_ls",
				"pyright",
				"ruff",
				"rust_analyzer",
				"stylua",
				"ts_ls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
}
