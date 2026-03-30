local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/danymat/neogen" })

later(function()
	require("neogen").setup({
		snippet_engine = "nvim",
	})
end)
