MiniDeps.add({ source = "numToStr/Comment.nvim" })

MiniDeps.later(function()
	require("Comment").setup()

	local ft = require("Comment.ft")

	ft.blade = { "{{--%s--}}", "{{--%s--}}" }
end)
