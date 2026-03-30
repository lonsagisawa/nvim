local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/rachartier/tiny-inline-diagnostic.nvim" })

later(function()
	require("tiny-inline-diagnostic").setup({
		preset = "classic",
	})

	vim.diagnostic.config({ virtual_text = false })
end)
