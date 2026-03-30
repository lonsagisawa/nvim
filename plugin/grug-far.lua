local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({{ src = "https://github.com/MagicDuck/grug-far.nvim" }})

later(function()
	vim.keymap.set("", "<leader>sg", function()
		require("grug-far").open()
	end, { desc = "grug-far" })
end)
