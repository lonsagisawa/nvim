---@class ddev.Terminal
local M = {}

--- DDEV Web コンテナのターミナルを開く
function M.open_web_terminal()
	local status = require("ddev.status")
	local project = status.current

	if not project or not project.root then
		vim.notify("Not in a DDEV project", vim.log.levels.WARN)
		return
	end

	-- DDEV が実行中か確認
	if project.status ~= "running" then
		vim.notify("DDEV is not running. Starting DDEV first...", vim.log.levels.INFO)
		-- 自動起動してからターミナルを開く
		local config = require("ddev.config")
		local start_term = Snacks.terminal.open({ "ddev", "start" }, {
			cwd = project.root,
			interactive = true,
			auto_close = false,
			win = config.config.terminal_win,
		})
		vim.api.nvim_create_autocmd("TermClose", {
			buffer = start_term.buf,
			once = true,
			callback = function()
				vim.schedule(function()
					local exit_status = type(vim.v.event) == "table" and vim.v.event.status or 0
					if exit_status ~= 0 then
						vim.notify("DDEV start failed. Check the terminal for errors.", vim.log.levels.ERROR)
						return
					end
					start_term:close()
					vim.notify("DDEV started. Opening terminal...", vim.log.levels.INFO)
					M.open_web_terminal()
				end)
			end,
		})
		return
	end

	-- Snacks.terminal.open で ddev ssh を実行
	local config = require("ddev.config")
	Snacks.terminal.open({ "ddev", "ssh" }, {
		cwd = project.root,
		interactive = true,
		win = config.config.terminal_win,
	})
end

--- 特定のサービスのターミナルを開く
---@param service string サービス名 (web, db, etc.)
function M.open_service_terminal(service)
	local status = require("ddev.status")
	local project = status.current

	if not project or not project.root then
		vim.notify("Not in a DDEV project", vim.log.levels.WARN)
		return
	end

	-- DDEV が実行中か確認
	if project.status ~= "running" then
		vim.notify("DDEV is not running. Please start DDEV first.", vim.log.levels.WARN)
		return
	end

	-- ddev ssh -s <service> を実行
	local config = require("ddev.config")
	Snacks.terminal.open({ "ddev", "ssh", "-s", service }, {
		cwd = project.root,
		interactive = true,
		win = config.config.terminal_win,
	})
end

return M
