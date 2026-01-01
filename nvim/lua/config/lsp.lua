-- This function is used below to add a keybind to toggle `virtual_text` diagnostics
local toggle_virtual_text = function()
	local current_config = vim.diagnostic.config()
	vim.diagnostic.config({
		virtual_text = not current_config.virtual_text,
	})
end

-- Custom keybinds
vim.keymap.set("n", "<leader>cd", vim.lsp.buf.definition, {})
vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, {})
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, {})
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover({
		border = "rounded",
	})
end)

vim.diagnostic.config({ virtual_lines = { current_line = true }, virtual_text = true })
vim.keymap.set("n", "<leader>d", toggle_virtual_text)
