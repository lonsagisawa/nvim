local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/folke/todo-comments.nvim" })

later(function()
	require("todo-comments").setup({})
end)
