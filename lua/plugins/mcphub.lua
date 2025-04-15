return {
    "ravitemer/mcphub.nvim",
    -- comment the following line to ensure hub will be ready at the earliest
    cmd = "MCPHub",  -- lazy load by default
    build = "bundled_build.lua",  -- Use this and set use_bundled_binary = true in opts  (see Advanced configuration)
    config = function()
      require("mcphub").setup({
			auto_approve = false,
			use_bundled_binary = true,
		})
    end,
}
