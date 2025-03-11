return {
	"stevearc/aerial.nvim",
	opts = {},
	keys = {
		{ "<leader>so", function() require("aerial").snacks_picker() end, desc = "code Outline with aerial" }
	}
}
