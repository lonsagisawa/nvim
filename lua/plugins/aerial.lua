local add = MiniDeps.add

add({ source = "stevearc/aerial.nvim" })

return {
	source = "stevearc/aerial.nvim",
	opts = {},
	keys = {
		{ "<leader>so", function() require("aerial").snacks_picker() end, desc = "code Outline with aerial" },
	},
}
