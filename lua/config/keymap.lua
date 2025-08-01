-- better up/down
-- from Lazyvim
vim.keymap.set({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
vim.keymap.set({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

-- Clear search with <esc>
-- from Lazyvim
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- better indenting
-- from Lazyvim
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- LSP
-- https://zenn.dev/botamotch/articles/21073d78bc68bf#.config%2Fnvim%2Finit.lua
vim.keymap.set("n", "gf", "<cmd>lua vim.lsp.buf.formatting()<CR>", { desc = "Format buffer using LS" })
vim.keymap.set("n", "gn", "<cmd>lua vim.lsp.buf.rename()<CR>", { desc = "Refactor: rename" })
vim.keymap.set("n", "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", { desc = "Code action" })
vim.keymap.set("n", "ge", "<cmd>lua vim.diagnostic.open_float()<CR>")
vim.keymap.set("n", "g]", "<cmd>lua vim.diagnostic.goto_next()<CR>")
vim.keymap.set("n", "g[", "<cmd>lua vim.diagnostic.goto_prev()<CR>")

-- set U to redo
-- https://zenn.dev/vim_jp/articles/43d021f461f3a4
vim.keymap.set({"n", "x"}, "U", "<c-r>")

-- smart paste indent
-- https://zenn.dev/vim_jp/articles/43d021f461f3a4
vim.keymap.set({"n", "x"}, "p", "]p`]")
vim.keymap.set({"n", "x"}, "P", "]P`]")
