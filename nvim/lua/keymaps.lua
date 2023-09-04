-- leader: プラグイン系のprefix
-- Ctrl:   通常キーのprefix

local keymap = vim.keymap
vim.g.mapleader = ' '

if vim.g.vscode then
  keymap.set("n", "<leader>s", "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
  keymap.set('n', '<leader>f', "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>")
  keymap.set('n', '<leader>b', "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
  keymap.set('n', '<C-h>', "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
  keymap.set('n', '<C-l>', "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
  keymap.set('n', '<C-W>', "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")
else
  keymap.set('i','jj','<Esc>')
  keymap.set('n', '<leader>s', function() require("telescope.builtin").find_files { hidden = true } end, {noremap = true})
  keymap.set('n', '<leader>f', '<Cmd>Fern .<CR>')
  keymap.set('n', '<C-h>', "<Cmd>bprev<CR>")
  keymap.set('n', '<C-l>', "<Cmd>bnext<CR>")
  keymap.set('n', '<C-w>', "<Cmd>bdelete<CR>")
end
-- 画面分割
keymap.set('n', 'ss', ':split <Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')
-- アクティブウィンドウの移動
keymap.set('n', 'sh', '<C-w>h')
keymap.set('n', 'sk', '<C-w>k')
keymap.set('n', 'sj', '<C-w>j')
keymap.set('n', 'sl', '<C-w>l')

-- Emacss風
keymap.set('i', '<C-f>', '<Right>')
-- 設定ファイルを開く
-- keymap.set('n','<F1>',':edit $MYVIMRC<CR>')

-- 行移動
keymap.set('n', '<S-h>', '0')
keymap.set('n', '<S-l>', '$')
