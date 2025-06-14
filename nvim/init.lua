-- bootstrap lazy.nvim, LazyVim and your plugins
if not vim.g.vscode then require("config.lazy") end
require("config.keymaps")
require("config.options")
