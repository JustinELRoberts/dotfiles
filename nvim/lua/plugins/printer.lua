return {
	"rareitems/printer.nvim",
	config = function()
		require("printer").setup({
			keymap = "gp",
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
		vim.keymap.set("n", "gp", "<Plug>(printer_print)iw")
		vim.keymap.set("v", "gp", "<Plug>(printer_print)")
	end,
}
