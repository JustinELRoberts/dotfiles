-- Pops up the available keybinds (and their `desc`) after pressing a prefix like <leader>
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- Centered, bordered floating box (the default "classic" is a borderless full-width bar)
		preset = "modern",
		-- Name the <leader> prefixes
		spec = {
			{ "<leader>b", group = "buffers" },
			{ "<leader>c", group = "code" },
			{ "<leader>f", group = "find" },
			{ "<leader>g", group = "git" },
			{ "<leader>s", group = "session" },
		},
	},
}
