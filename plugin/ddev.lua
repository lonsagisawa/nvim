local later = function(f) require("mini.misc").safely('later', f) end

vim.pack.add({ "https://github.com/lonsagisawa/ddev.nvim" })

later(function()
	require("ddev").setup({
		refresh_interval = 10,
		terminal_win = {
			position = "right",
			width = 0.4,
		}
	})

	-- DDEV アクションピッカー
	vim.keymap.set("n", "<leader>dd", function() require("ddev.actions").open_picker() end, { desc = "Open DDEV actions" })
	-- ブラウザで起動
	vim.keymap.set("n", "<leader>dl", function() require("ddev.actions").launch() end, { desc = "Launch DDEV local server browser window" })
	-- Sequel Ace でデータベースを開く
	vim.keymap.set("n", "<leader>ds", function() require("ddev.actions").open_sequel_ace() end, { desc = "Launch DDEV database in Sequel Ace" })
	-- DDEV Web コンテナのターミナルを開く
	vim.keymap.set("n", "<leader>dt", function() require("ddev.terminal").open_web_terminal() end, { desc = "Open DDEV Web container terminal" })
	-- DB コンテナのターミナルを開く
	vim.keymap.set("n", "<leader>db", function() require("ddev.terminal").open_service_terminal('db') end, { desc = "Open DDEV DB container terminal" })
	-- DDEV サービス一覧を開く
	vim.keymap.set("n", "<leader>dS", function() require("ddev.services").open_picker() end, { desc = "Open DDEV services" })
end)
