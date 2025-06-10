-- bootstrap lazy.nvim, LazyVim and your plugins

require("config.lazy")
require("config.keymaps")

vim.cmd('language en_US.UTF-8')

if vim.g.vscode then
  return
end
