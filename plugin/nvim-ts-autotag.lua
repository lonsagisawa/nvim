local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/windwp/nvim-ts-autotag" })

later(function()
	require("nvim-ts-autotag").setup({})
end)
