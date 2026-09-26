-- Pops up the available keybinds (and their `desc`) after pressing a prefix like <leader>
return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	opts = {
		-- Centered, bordered floating box (the default "classic" is a borderless full-width bar)
		preset = "modern",
		-- Wait 1s of inactivity before popping up (the timer restarts on every keypress).
		-- Built-in pickers like marks (') and registers (") still show instantly.
		delay = function(ctx)
			return ctx.plugin and 0 or 1000
		end,
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
