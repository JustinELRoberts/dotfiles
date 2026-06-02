vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition)

local use_virtual_lines = true

-- Toggle between virtual_lines (multiline, current line only) and virtual_text (inline at EOL)
local toggle_diagnostics = function()
	use_virtual_lines = not use_virtual_lines
	vim.diagnostic.config({
		virtual_lines = use_virtual_lines and { current_line = true } or false,
		virtual_text = not use_virtual_lines,
	})
end

vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = false })
vim.keymap.set("n", "<leader>d", toggle_diagnostics)
