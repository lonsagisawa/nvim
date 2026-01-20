MiniDeps.add({ source = "MagicDuck/grug-far.nvim" })

MiniDeps.later(function()
	vim.keymap.set("", "<leader>sg", function()
		require("grug-far").open()
	end, { desc = "grug-far" })
end)
