local add = MiniDeps.add

add({ source = "mason-org/mason-lspconfig.nvim" })

return {
	source = "mason-org/mason-lspconfig.nvim",
	-- 設定をここに書かない！config/lsp.luaにまとめて書いている
}
