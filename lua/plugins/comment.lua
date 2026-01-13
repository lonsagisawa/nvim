local add = MiniDeps.add

add({ source = "numToStr/Comment.nvim" })

return {
	source = "numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()

		local ft = require("Comment.ft")

		ft.blade = { "{{--%s--}}", "{{--%s--}}" }
	end,
}
