-- laravel-ls
-- masonではまだインストールできないので、別途インストールする
-- mise use --global go:github.com/laravel-ls/laravel-ls/cmd/laravel-ls@latest

---@type vim.lsp.Config
return {
	cmd = {
		"laravel-ls",
	},
	root_markers = { "artisan" },
	filetypes = { "php", "blade" },
}
