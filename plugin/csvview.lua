local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/hat0uma/csvview.nvim" })

later(function()
	require("csvview").setup({
		parser = { comments = { "#", "//" } },
		keymaps = {
			textobject_field_inner = { "if", mode = { "o", "x" } },
			textobject_field_outer = { "af", mode = { "o", "x" } },
			jump_next_field_end = { "<Tab>", mode = { "n", "v" } },
			jump_prev_field_end = { "<S-Tab>", mode = { "n", "v" } },
			jump_next_row = { "<Enter>", mode = { "n", "v" } },
			jump_prev_row = { "<S-Enter>", mode = { "n", "v" } },
		},
		view = {
			display_mode = "border",
		},
	})
end)
