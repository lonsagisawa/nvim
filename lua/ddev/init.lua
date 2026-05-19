local M = {}

---@param opts? ddev.Config
function M.setup(opts)
	local config = require("ddev.config")
	config.setup(opts)

	local lualine = require("ddev.lualine")
	lualine.setup_highlights()

	-- Register user command
	vim.api.nvim_create_user_command("Ddev", function()
		require("ddev.actions").open_picker()
	end, { desc = "Open DDEV actions picker" })

	-- Start periodic status updates
	require("ddev.status").start_timer()
end

return M
