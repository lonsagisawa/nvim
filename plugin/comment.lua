local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/numToStr/Comment.nvim" })

later(function()
	require("Comment").setup()

	local ft = require("Comment.ft")

	ft.blade = { "{{--%s--}}", "{{--%s--}}" }
end)
