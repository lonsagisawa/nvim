local later = function(f)
	require("mini.misc").safely("later", f)
end

vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })

later(function()
	require("bufferline").setup({
		highlights = require("catppuccin.special.bufferline").get_theme(),
	})
end)
