return {
	"carlos-algms/agentic.nvim",
	event = "VeryLazy",
	opts = {
		-- Available by default: "claude-acp" | "gemini-acp" | "codex-acp" | "opencode-acp" | "cursor-acp"
		provider = "codex-acp", -- setting the name here is all you need to get started
	},

	-- these are just suggested keymaps; customize as desired
	keys = {
		{
			"<c-.>",
			function()
				require("agentic").toggle()
			end,
			mode = { "n", "v", "i" },
			desc = "Toggle Agentic Chat",
		},
		{
			"<leader>ac",
			function()
				require("agentic").toggle()
			end,
			desc = "Toggle Agentic Chat",
		},
		{
			"<leader>at",
			function()
				require("agentic").add_selection_or_file_to_context()
			end,
			mode = { "x", "n" },
			desc = "Add file or selection to Agentic to Context",
		},
		{
			"<leader>af",
			function()
				require("agentic").add_file()
			end,
			desc = "Add file to Agentic to Context",
		},
	},
}
