vim.cmd('language en_US.UTF-8')
require("options")
require("keymaps")

if vim.g.vscode then
  require("vscode")
  vim.cmd[[colorscheme iceberg]]
  return
end

require("plugins")
require'nvim-treesitter.configs'.setup{highlight={enable=true}}
-- require("packer_compiled")
require('git').setup()
require("lualine").setup()
vim.cmd[[colorscheme iceberg]]
