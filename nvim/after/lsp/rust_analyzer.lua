return {
	settings = {
		["rust-analyzer"] = {
			cargo = {
				allFeatures = true,
			},
			check = {
				allFeatures = true,
				command = "clippy",
			},
		},
	},
}
