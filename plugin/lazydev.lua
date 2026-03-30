local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/Bilal2453/luvit-meta" })
vim.pack.add({ "https://github.com/folke/lazydev.nvim" })

later(function()
	require("lazydev").setup({
		library = {
			{ path = "luvit-meta/library", words = { "vim%.uv" } },
		},
	})
end)
