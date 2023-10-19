require'bufferline'.setup {
-- 好みの設定をここに書く
}
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Close buffer
map('n', '<leader>e', '<Cmd>BufferClose<CR>', opts) --<leader>+eでBufferを削除
