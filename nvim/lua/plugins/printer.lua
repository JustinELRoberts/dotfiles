return {
	"rareitems/printer.nvim",
	config = function()
		require("printer").setup({
			keymap = "<leader>p",
			behavior = "insert_below",
			formatters = {
				typescript = function(inside, variable)
					return string.format('console.log("%s: " + %s)', inside, variable)
				end,
				typescriptreact = function(inside, variable)
					return string.format('console.log("%s: " + %s)', inside, variable)
				end,
			},
			-- function which modifies the text inside string in the print statement, by default it adds the path and line number
			add_to_inside = function(text)
				return string.format("%s", text)
			end,
		})

		-- Print currently hovered word
		vim.keymap.set("n", "<leader>p", "<Plug>(printer_print)iw", { desc = "Print word under cursor" })
		vim.keymap.set("v", "<leader>p", "<Plug>(printer_print)", { desc = "Print selection" })
	end,
}
