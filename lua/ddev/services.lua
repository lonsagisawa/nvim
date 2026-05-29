---@class ddev.ServiceDisplay
---@field name string サービス名 (web, mailpit, etc.)
---@field full_name string コンテナのフルネーム
---@field url string|nil HTTP/HTTPS URL

---@class ddev.Services
local M = {}

--- status.current からサービス一覧を構築
---@return ddev.ServiceDisplay[]
function M.get_services()
	local status = require("ddev.status")
	local project = status.current
	if not project or not project.services then
		return {}
	end

	local services = {}

	-- project.services をループして URL を解決 (httpsUrl > httpUrl)
	for name, info in pairs(project.services) do
		local url = info.https_url or info.http_url
		table.insert(services, {
			name = name,
			full_name = info.full_name,
			url = url,
		})
	end

	-- mailpit URL があれば "mailpit" として追加
	if project.mailpit_url then
		table.insert(services, {
			name = "mailpit",
			full_name = "Mailpit",
			url = project.mailpit_url,
		})
	end

	-- URL があるサービスのみを返す
	local filtered = {}
	for _, svc in ipairs(services) do
		if svc.url and svc.url ~= "" then
			table.insert(filtered, svc)
		end
	end

	-- 名前でソート
	table.sort(filtered, function(a, b)
		return a.name < b.name
	end)

	return filtered
end

--- サービス一覧のピッカーを開く
function M.open_picker()
	local status = require("ddev.status")
	local project = status.current

	if not project then
		vim.notify("Not in a DDEV project", vim.log.levels.WARN)
		return
	end

	if project.status ~= "running" then
		vim.notify("DDEV is not running. Please start DDEV first.", vim.log.levels.WARN)
		return
	end

	local items = M.get_services()
	if #items == 0 then
		vim.notify("No services available", vim.log.levels.INFO)
		return
	end

	--- @type snacks.picker.finder.Item[]
	local picker_items = {}
	for i, svc in ipairs(items) do
		table.insert(picker_items, {
			idx = i,
			score = i,
			text = svc.name .. " - " .. svc.url,
			service = svc,
		})
	end

	Snacks.picker({
		title = "DDEV Services: " .. project.name,
		items = picker_items,
		format = "text",
		layout = "select",
		confirm = function(picker, item)
			picker:close()
			if item and item.service and item.service.url then
				vim.ui.open(item.service.url)
			end
		end,
	})
end

return M
