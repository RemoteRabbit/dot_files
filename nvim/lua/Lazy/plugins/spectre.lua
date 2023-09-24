return {
	"nvim-pack/nvim-spectre",
	dependencies = { "nvim-lua/plenary.nvim" },
	cmd = "Spectre",
	opts = { open_cmd = "noswapfile vnew" },
	config = function()
		local wk = require("which-key")
		wk.register({
			f = {
				r = { "<CMD>Spectre<CR>", "Replace in files (Spectre)" },
			},
		}, { prefix = "<leader>" })
	end,
}
