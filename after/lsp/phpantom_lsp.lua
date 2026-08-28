return {
	-- phpantom_lsp only serves pull diagnostics, and answers the pull that follows a
	-- didChange with its pre-edit analysis. It sends workspace/diagnostic/refresh ~500ms
	-- later, once the reanalysis lands. But because it advertises workspaceDiagnostics,
	-- vim.lsp.diagnostic.on_refresh routes that into a workspace pull, whose results are
	-- discarded for buffers already on a document pull (see vim/lsp/diagnostic.lua) -- so
	-- fixed errors keep their diagnostics until the next edit. Dropping the capability
	-- makes on_refresh re-pull the open buffers instead.
	on_init = function(client)
		local provider = client.server_capabilities.diagnosticProvider
		if provider then
			provider.workspaceDiagnostics = false
		end
	end,
}
