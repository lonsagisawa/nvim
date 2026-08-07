# Neovim configuration

Just another generic webdev neovim configuration. Almost just slapping [Snacks.nvim](https://github.com/folke/snacks.nvim) and [MINI](https://github.com/nvim-mini/mini.nvim) components, and some plugin addition.

## PHP development

This config uses [PHPantom LSP](https://github.com/PHPantom-dev/phpantom_lsp) which currently in active development.
Mason registry currently has old version so I'd manually manage it. It can installed via mise-en-place with ease.
Also using [Laravel official LSP](https://github.com/laravel/lsp).

```
mise use --global github:PHPantom-dev/phpantom_lsp
mise use --global github:laravel/lsp[rename_exe=laravel-lsp]@latest
```
