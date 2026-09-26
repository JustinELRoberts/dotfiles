return {
	{
		"stevearc/conform.nvim",
		config = function()
			require("conform").setup({
				formatters_by_ft = {
					bash = { "shfmt" },
					css = { "prettier" },
					html = { "prettier" },
					javascript = { "prettier" },
					json = { "prettier" },
					lua = { "stylua" },
					python = { "ruff_fix", "ruff_format" },
					rust = { "rustfmt" },
					sh = { "shfmt" },
					svelte = { "prettier" },
					toml = { "taplo" },
					typescript = { "prettier" },
					yaml = { "prettier" },
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
			-- stylua ships an LSP mode, but conform already runs it as a formatter
			automatic_enable = { exclude = { "stylua" } },
			ensure_installed = {
				"bashls",
				"cssls",
				"jsonls",
				"lua_ls",
				"pyright",
				"ruff",
				"rust_analyzer",
				"svelte",
				"taplo",
				"ts_ls",
			},
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
	{
		-- Installs non-LSP tools (formatters) through Mason
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = { "mason-org/mason.nvim" },
		opts = {
			ensure_installed = { "prettier", "shfmt", "stylua" },
		},
	},
}
