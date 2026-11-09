local later = function(f)
	require("mini.misc").safely("later", f)
end

-- depends on snacks.nvim (plugin/snacks.lua)
vim.pack.add({ "https://github.com/coder/claudecode.nvim" })

later(function()
	require("claudecode").setup({})

	-- <leader>a is used by sidekick.nvim, so use <leader>k for Claude Code
	-- stylua: ignore start
	vim.keymap.set("n", "<leader>ac", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
	vim.keymap.set("n", "<leader>af", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
	vim.keymap.set("n", "<leader>ar", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
	vim.keymap.set("n", "<leader>aC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
	vim.keymap.set("n", "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
	vim.keymap.set("n", "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
	vim.keymap.set("x", "<leader>as", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
	vim.keymap.set("n", "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
	vim.keymap.set("n", "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })
	-- stylua: ignore end

	-- add file from file explorer (equivalent of lazy.nvim's `ft` keys)
	vim.api.nvim_create_autocmd("FileType", {
		pattern = { "minifiles", "netrw" },
		group = vim.api.nvim_create_augroup("claudecode_tree_add", { clear = true }),
		callback = function(ev)
			vim.keymap.set("n", "<leader>as", "<cmd>ClaudeCodeTreeAdd<cr>", { buffer = ev.buf, desc = "Add file" })
		end,
	})
end)
