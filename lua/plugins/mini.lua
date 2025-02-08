return {
	"echasnovski/mini.nvim",
	version = false,
	config = function()
		require("mini.cursorword").setup()
		require("mini.trailspace").setup()

		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				require("mini.trailspace").trim()
				require("mini.trailspace").trim_last_lines()
			end,
		})
	end,
}
