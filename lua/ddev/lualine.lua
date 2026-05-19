local M = {}

--- Get highlight group based on status
---@param status string
---@return string
local function get_hl(status)
	if status == "running" then
		return "DdevRunning"
	elseif status == "paused" then
		return "DdevPaused"
	else
		return "DdevStopped"
	end
end

--- Convert Neovim's numeric RGB highlight value to lualine's hex color format.
---@param color integer|nil
---@return string|nil
local function to_hex_color(color)
	if not color then
		return nil
	end
	return string.format("#%06x", color)
end

--- Setup highlight groups
function M.setup_highlights()
	vim.api.nvim_set_hl(0, "DdevRunning", { link = "DiagnosticOk" })
	vim.api.nvim_set_hl(0, "DdevPaused", { link = "DiagnosticWarn" })
	vim.api.nvim_set_hl(0, "DdevStopped", { link = "DiagnosticError" })
end

--- Lualine component definition (for use in lualine sections)
---@type table
M.lualine_component = {
	function()
		local status = require("ddev.status")
		local project = status.current
		if not project then
			return ""
		end
		return "󰬋 " .. project.name .. ":" .. project.status
	end,
	color = function()
		local status = require("ddev.status")
		local project = status.current
		if not project then
			return {}
		end
		return { fg = to_hex_color(vim.api.nvim_get_hl(0, { name = get_hl(project.status) }).fg) }
	end,
	on_click = function()
		require("ddev.actions").open_picker()
	end,
}

return M
