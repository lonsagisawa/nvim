MiniDeps.add({ source = "folke/sidekick.nvim" })

require("sidekick").setup({
	nes = {
		enabled = false,
	},
	cli = {
		mux = {
			enabled = false,
		},
		tools = {
			amp = {
				cmd = { "amp" },
			},
		},
	},
})

vim.keymap.set({ "n", "t", "i", "x" }, "<c-.>", function()
	require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle" })

vim.keymap.set("", "<leader>aa", function()
	require("sidekick.cli").toggle()
end, { desc = "Sidekick Toggle CLI" })

vim.keymap.set("", "<leader>as", function()
	require("sidekick.cli").select()
end, { desc = "Select CLI" })

vim.keymap.set("", "<leader>ad", function()
	require("sidekick.cli").close()
end, { desc = "Detach a CLI Session" })

vim.keymap.set({ "x", "n" }, "<leader>at", function()
	require("sidekick.cli").send({ msg = "{this}" })
end, { desc = "Send This" })

vim.keymap.set("", "<leader>af", function()
	require("sidekick.cli").send({ msg = "{file}" })
end, { desc = "Send File" })

vim.keymap.set("x", "<leader>av", function()
	require("sidekick.cli").send({ msg = "{selection}" })
end, { desc = "Send Visual Selection" })

vim.keymap.set({ "n", "x" }, "<leader>ap", function()
	require("sidekick.cli").prompt()
end, { desc = "Sidekick Select Prompt" })

vim.keymap.set("", "<leader>ac", function()
	require("sidekick.cli").toggle({ name = "codex", focus = true })
end, { desc = "Sidekick Toggle Codex" })

vim.keymap.set("", "<leader>ao", function()
	require("sidekick.cli").toggle({ name = "opencode", focus = true })
end, { desc = "Sidekick Toggle opencode" })

vim.keymap.set("", "<leader>amp", function()
	require("sidekick.cli").toggle({ name = "amp", focus = true })
end, { desc = "Sidekick Toggle amp" })
