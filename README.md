# Neovim configuration

Just another generic webdev neovim configuration. Almost just slapping [Snacks.nvim](https://github.com/folke/snacks.nvim) and [MINI](https://github.com/nvim-mini/mini.nvim) components, and some plugin addition.

## PHP development

This config uses [Laravel official LSP](https://github.com/laravel/lsp) which currently is not in Mason registry so I'd manually manage it. It can installed via mise-en-place with ease.

```
mise use --global github:laravel/lsp[rename_exe=laravel-lsp]@latest
```
