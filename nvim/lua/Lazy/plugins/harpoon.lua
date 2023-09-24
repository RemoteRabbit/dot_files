return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local wk = require("which-key")
		wk.register({
			h = {
				name = "harpoon",
				h = { "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>", "UI" },
				m = { "<CMD>lua require('harpoon.mark').add_file()<CR>", "Add file to harpoon" },
				n = { "<CMD>lua require('harpoon.ui').nav_next()<CR>", "Next harpoon file" },
				p = { "<CMD>lua require('harpoon.ui').nav_prev()<CR>", "Previous harpoon file" },
			},
		}, { prefix = "<leader>" })
	end,
}
