return {
	"MagicDuck/grug-far.nvim",
	config = function() end,
	keys = {
		{
			"<leader>sg",
			function()
				require("grug-far").open()
			end,
			desc = "grug-far",
		},
	},
}
