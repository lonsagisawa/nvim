local add = MiniDeps.add

add({ source = "MagicDuck/grug-far.nvim" })

return {
	source = "MagicDuck/grug-far.nvim",
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
