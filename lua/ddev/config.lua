---@class ddev.Config
---@field refresh_interval integer Status update interval in seconds (default: 10)

local M = {}

---@type ddev.Config
local defaults = {
	refresh_interval = 10,
}

---@type ddev.Config
M.config = vim.deepcopy(defaults)

---@param opts? ddev.Config
function M.setup(opts)
	M.config = vim.tbl_deep_extend("force", vim.deepcopy(defaults), opts or {})
end

return M
