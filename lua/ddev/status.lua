---@class ddev.ServiceInfo
---@field full_name string コンテナのフルネーム
---@field https_url string|nil
---@field http_url string|nil

---@class ddev.ProjectInfo
---@field root string Project root directory (contains .ddev/)
---@field name string Project name
---@field status string "running" | "paused" | "stopped"
---@field services table<string, ddev.ServiceInfo>|nil サービス一覧
---@field mailpit_url string|nil Mailpit の URL

local M = {}

---@type ddev.ProjectInfo|nil
M.current = nil

---@type uv_timer_t|nil
M._timer = nil

--- Find .ddev/config.yaml by walking up from cwd
---@param start_path? string
---@return string|nil root
function M.find_project_root(start_path)
	start_path = start_path or vim.fn.getcwd()
	local path = vim.fn.fnamemodify(start_path, ":p:h")
	-- Walk up the directory tree
	while path ~= "/" do
		if vim.fn.filereadable(path .. "/.ddev/config.yaml") == 1 then
			return path
		end
		local parent = vim.fn.fnamemodify(path, ":h")
		if parent == path then
			break
		end
		path = parent
	end
	return nil
end

--- Run `ddev status -j` and parse the result
---@param project_root string
---@param callback fun(info: ddev.ProjectInfo|nil)
function M.fetch_status(project_root, callback)
	vim.system(
		{ "ddev", "status", "-j" },
		{ cwd = project_root },
		function(result)
			if result.code ~= 0 then
				vim.schedule(function()
					callback(nil)
				end)
				return
			end

			local ok, decoded = pcall(vim.json.decode, result.stdout)
			if not ok or type(decoded) ~= "table" then
				vim.schedule(function()
					callback(nil)
				end)
				return
			end

			-- ddev status -j returns { level, msg, raw: { name, status, ... } }
			local raw = decoded.raw
			if type(raw) ~= "table" or not raw.name then
				vim.schedule(function()
					callback(nil)
				end)
				return
			end

			-- サービス情報をパース
			local services = nil
			if type(raw.services) == "table" then
				services = {}
				for svc_name, svc_info in pairs(raw.services) do
					if type(svc_info) == "table" then
						services[svc_name] = {
							full_name = svc_info.full_name or "",
							https_url = svc_info.https_url,
							http_url = svc_info.http_url,
						}
					end
				end
			end

			-- Mailpit URL を解決 (HTTPS 優先)
			local mailpit_url = raw.mailpit_https_url or raw.mailpit_http_url

			vim.schedule(function()
				callback({
					root = project_root,
					name = raw.name,
					status = raw.status or "stopped",
					services = services,
					mailpit_url = mailpit_url,
				})
			end)
		end
	)
end

--- Update the current project status
---@param callback? fun(info: ddev.ProjectInfo|nil)
function M.update(callback)
	callback = callback or function() end
	local root = M.find_project_root()

	if not root then
		M.current = nil
		callback(nil)
		return
	end

	M.fetch_status(root, function(info)
		M.current = info
		callback(info)
		-- Notify lualine to refresh
		vim.cmd("redrawstatus")
	end)
end

--- Start the periodic timer
function M.start_timer()
	M.stop_timer()

	-- Initial fetch
	M.update()

	local interval = require("ddev.config").config.refresh_interval * 1000
	M._timer = vim.uv.new_timer()
	M._timer:start(interval, interval, function()
		vim.schedule(function()
			M.update()
		end)
	end)
end

--- Stop the periodic timer
function M.stop_timer()
	if M._timer then
		M._timer:stop()
		M._timer:close()
		M._timer = nil
	end
end

return M
