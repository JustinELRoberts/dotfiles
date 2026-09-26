return {
	"lewis6991/gitsigns.nvim",
	config = function()
		local gitsigns = require("gitsigns")

		gitsigns.setup({
			current_line_blame = true,
		})

		-- Next and previous git hunk
		vim.keymap.set("n", "[g", function()
			gitsigns.nav_hunk("prev")
		end, { desc = "Previous git hunk" })
		vim.keymap.set("n", "]g", function()
			gitsigns.nav_hunk("next")
		end, { desc = "Next git hunk" })

		-- Stage the hunk that our cursor is currently in (or unstage it, if already staged)
		vim.keymap.set("n", "<leader>gs", gitsigns.stage_hunk,{ desc = "Stage/unstage hunk" })
		-- Stage all the hunks our selection intersects
		vim.keymap.set("v", "<leader>gs", function()
			gitsigns.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Stage selected hunks" })
		-- Stage entire buffer
		vim.keymap.set({ "n", "v" }, "<leader>gS", gitsigns.stage_buffer,{ desc = "Stage buffer" })

		-- Revert changes in the hunk our cursor is currently in (only if it is not staged)
		vim.keymap.set("n", "<leader>gr", gitsigns.reset_hunk,{ desc = "Reset hunk" })
		-- Revert changes in all hunks our selection intersects (and are not yet staged)
		vim.keymap.set("v", "<leader>gr", function()
			gitsigns.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
		end, { desc = "Reset selected hunks" })
		-- Revert changes in all hunks in the buffer (that are not yet staged)
		vim.keymap.set({ "n", "v" }, "<leader>gR", gitsigns.reset_buffer,{ desc = "Reset buffer" })

		-- Select (highlight) the hunk we are inside of
		vim.keymap.set("n", "<leader>gh", gitsigns.select_hunk,{ desc = "Select hunk" })

		-- Preview the changes made in the hunk under our cursor
		vim.keymap.set("n", "<leader>gp", gitsigns.preview_hunk_inline,{ desc = "Preview hunk inline" })

		-- Toggle highlighting word diffs
		vim.keymap.set("n", "<leader>gw", gitsigns.toggle_word_diff,{ desc = "Toggle word diff" })

		-- Open a buffer to view the git diff
		vim.keymap.set("n", "<leader>gd", gitsigns.diffthis,{ desc = "Diff against index" })

		-- Open a window to view the git blame
		vim.keymap.set("n", "<leader>gb", gitsigns.blame,{ desc = "Git blame" })
	end,
}
