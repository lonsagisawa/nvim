local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({
	"https://github.com/nvim-lualine/lualine.nvim",
	"https://github.com/b0o/incline.nvim",
})

later(function()
	require("incline").setup({
		window = {
			padding = 0,
		},
		render = function(props)
			local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
			if filename == "" then
				filename = "[No Name]"
			end
			local modified = vim.bo[props.buf].modified and " ●" or ""

			local hl
			if props.focused then
				local mode = vim.fn.mode()
				local mode_map = {
					n = "normal",
					i = "insert",
					v = "visual",
					V = "visual",
					["\22"] = "visual",
					c = "command",
					R = "replace",
					t = "terminal",
				}
				local mode_name = mode_map[mode] or "normal"
				hl = "lualine_a_" .. mode_name
			else
				hl = "lualine_b_normal"
			end

			return { { " " .. filename .. modified .. " ", group = hl } }
		end,
	})
end)
