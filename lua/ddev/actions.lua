local M = {}

---@class ddev.Action
---@field name string Display name
---@field cmd string[] Command to execute
---@field exec "terminal"|"background" Execution method

---@type ddev.Action[]
M.actions = {
	{ name = "Start", cmd = { "ddev", "start" }, exec = "terminal" },
	{ name = "Stop", cmd = { "ddev", "stop" }, exec = "terminal" },
	{ name = "Restart", cmd = { "ddev", "restart" }, exec = "terminal" },
	{ name = "Launch", cmd = { "ddev", "launch" }, exec = "background" },
	{ name = "DBeaver", cmd = { "ddev", "dbeaver" }, exec = "background" },
	{ name = "TablePlus", cmd = { "ddev", "tableplus" }, exec = "background" },
	{ name = "Sequel Ace", cmd = { "ddev", "sequelace" }, exec = "background" },
}

--- Execute a ddev action
---@param action ddev.Action
function M.execute(action)
	local status = require("ddev.status")
	local project = status.current
	if not project or not project.root then
		vim.notify("Not in a DDEV project", vim.log.levels.WARN)
		return
	end

	if action.exec == "terminal" then
		Snacks.terminal.open(action.cmd, {
			cwd = project.root,
			interactive = true, -- auto_close on exit
		})
	elseif action.exec == "background" then
		vim.system(action.cmd, { cwd = project.root }, function(result)
			if result.code ~= 0 then
				vim.schedule(function()
					vim.notify(
						"Command failed: " .. table.concat(action.cmd, " ") .. "\n" .. (result.stderr or ""),
						vim.log.levels.ERROR
					)
				end)
			end
		end)
	end
end

--- Open the DDEV actions picker
function M.open_picker()
	local status = require("ddev.status")
	local project = status.current

	if not project then
		vim.notify("Not in a DDEV project", vim.log.levels.WARN)
		return
	end

	--- @type snacks.picker.finder.Item[]
	local items = {}
	for i, action in ipairs(M.actions) do
		table.insert(items, {
			idx = i,
			score = i,
			text = action.name,
			action = action,
		})
	end

	Snacks.picker({
		title = "DDEV: " .. project.name .. " (" .. project.status .. ")",
		items = items,
		format = "text",
		layout = "select",
		confirm = function(picker, item)
			picker:close()
			if item and item.action then
				M.execute(item.action)
			end
		end,
	})
end

return M
