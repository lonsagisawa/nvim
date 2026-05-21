local later = function(f) require("mini.misc").safely('later', f) end

later(function()
	require("ddev").setup()

	vim.keymap.set("n", "<leader>dd", function() require("ddev.actions").open_picker() end, { desc = "Open DDEV actions" })
	vim.keymap.set("n", "<leader>dl", function() require("ddev.actions").launch() end, { desc = "Launch DDEV local server browser window" })
	vim.keymap.set("n", "<leader>ds", function() require("ddev.actions").open_sequel_ace() end, { desc = "Launch DDEV database in Sequel Ace" })
end)
