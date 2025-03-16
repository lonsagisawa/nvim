return {
	"greggh/claude-code.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim", -- Required for git operations
	},
	opts = {},
	keys = {
		{ "<leader>c", "<cmd>ClaudeCode<CR>", desc = "Claude Code" }
	},
}
