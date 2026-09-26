return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local theta = require("alpha.themes.theta")
		-- theta defaults to mini.icons; use devicons like every other plugin here
		theta.file_icons.provider = "devicons"
		require("alpha").setup(theta.config)
	end,
}
