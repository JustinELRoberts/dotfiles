-- Pops up the available keybinds (and their `desc`) after pressing a prefix like <leader>
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- Centered, bordered floating box (the default "classic" is a borderless full-width bar)
		preset = "modern",
		-- Wait 1s of inactivity before popping up (the timer restarts on every keypress).
		-- Applies to built-in pickers like marks (') and registers (") too.
		delay = 1000,
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
