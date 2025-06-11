return {
	"GeorgesAlkhouri/nvim-aider",
	cmd = "Aider",
	-- Example key mappings for common actions:
	keys = {
		{ "<leader>a/", "<cmd>Aider toggle<cr>", desc = "aider: Toggle" },
		{ "<leader>as", "<cmd>Aider send<cr>", desc = "aider: Send to Aider", mode = { "n", "v" } },
		{ "<leader>ac", "<cmd>Aider command<cr>", desc = "aider: Aider Commands" },
		{ "<leader>ab", "<cmd>Aider buffer<cr>", desc = "aider: Send Buffer" },
		{ "<leader>a+", "<cmd>Aider add<cr>", desc = "aider: Add File" },
		{ "<leader>a-", "<cmd>Aider drop<cr>", desc = "aider: Drop File" },
		{ "<leader>ar", "<cmd>Aider add readonly<cr>", desc = "aider: Add Read-Only" },
		{ "<leader>aR", "<cmd>Aider reset<cr>", desc = "aider: Reset Session" },
	},
	dependencies = {
		"folke/snacks.nvim",
	},
	config = true,
}
