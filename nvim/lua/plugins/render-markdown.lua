return {
	"MeanderingProgrammer/render-markdown.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local renderMarkdown = require("render-markdown")
    renderMarkdown.setup({
			file_types = { "markdown" },
		})
	end,
}
