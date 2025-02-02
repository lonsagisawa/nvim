# neovim configuration

## laravel-ls

```shell
# install go
mise use --global go@latest

# Clone and build
git clone git@github.com:laravel-ls/laravel-ls.git
cd laravel-ls
make

# make link
mkdir -p ~/.local/bin
ln -sf ~/laravel-ls/build/laravel-ls ~/.local/bin
```
