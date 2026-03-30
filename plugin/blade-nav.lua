local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/ricardoramirezr/blade-nav.nvim" })

later(function()
	require("blade-nav").setup({})
end)
