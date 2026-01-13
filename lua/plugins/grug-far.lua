local add = MiniDeps.add

add({ source = "MagicDuck/grug-far.nvim" })

vim.keymap.set("", "<leader>sg", function()
	require("grug-far").open()
end, { desc = "grug-far" })
