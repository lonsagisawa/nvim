MiniDeps.add({ source = "numToStr/Comment.nvim" })

require("Comment").setup()

local ft = require("Comment.ft")

ft.blade = { "{{--%s--}}", "{{--%s--}}" }
