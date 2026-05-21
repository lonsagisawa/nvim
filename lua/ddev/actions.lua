local M = {}

---@class ddev.Action
---@field name string Display name
---@field cmd string[] Command to execute
---@field exec "terminal"|"background" Execution method

---@type table<string, ddev.Action>
local actions = {
	start = { name = "Start", cmd = { "ddev", "start" }, exec = "terminal" },
	stop = { name = "Stop", cmd = { "ddev", "stop" }, exec = "terminal" },
	restart = { name = "Restart", cmd = { "ddev", "restart" }, exec = "terminal" },
	launch = { name = "Launch", cmd = { "ddev", "launch" }, exec = "background" },
	open_dbeaver = { name = "Open DBeaver", cmd = { "ddev", "dbeaver" }, exec = "background" },
	open_tableplus = { name = "Open TablePlus", cmd = { "ddev", "tableplus" }, exec = "background" },
	open_sequel_ace = { name = "Open Sequel Ace", cmd = { "ddev", "sequelace" }, exec = "background" },
}

---@type ddev.Action[]
M.actions = {
	actions.start,
	actions.stop,
	actions.restart,
	actions.launch,
	actions.open_dbeaver,
	actions.open_tableplus,
	actions.open_sequel_ace,
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
			win = {
				position = "bottom",
				height = 0.3,
			},
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

--- Run `ddev start`
function M.start()
	M.execute(actions.start)
end

--- Run `ddev stop`
function M.stop()
	M.execute(actions.stop)
end

--- Run `ddev restart`
function M.restart()
	M.execute(actions.restart)
end

--- Run `ddev launch`
function M.launch()
	M.execute(actions.launch)
end

--- Run `ddev dbeaver`
function M.open_dbeaver()
	M.execute(actions.open_dbeaver)
end

--- Run `ddev tableplus`
function M.open_tableplus()
	M.execute(actions.open_tableplus)
end

--- Run `ddev sequelace`
function M.open_sequel_ace()
	M.execute(actions.open_sequel_ace)
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
