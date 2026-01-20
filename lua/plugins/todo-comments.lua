MiniDeps.add({ source = "folke/todo-comments.nvim" })

MiniDeps.later(function()
	require("todo-comments").setup({})
end)
