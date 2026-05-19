local later = function(f) require("mini.misc").safely('later', f) end

later(function()
	require("ddev").setup()

	vim.keymap.set("n", "<leader>dd", function() require("ddev.actions").open_picker() end)
end)
