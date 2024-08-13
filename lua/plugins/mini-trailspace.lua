return {
	"echasnovski/mini.trailspace",
	version = false,
	opts = {},
	config = function()
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				require("mini.trailspace").trim()
				require("mini.trailspace").trim_last_lines()
			end,
		})
	end,
}
