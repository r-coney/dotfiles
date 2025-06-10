-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- leader: プラグイン系のprefix
-- Ctrl:   通常キーのprefix
vim.g.mapleader = " "
local keymap = vim.keymap

if vim.g.vscode then
    keymap.set("n", "<leader>s",
               "<Cmd>call VSCodeNotify('workbench.action.quickOpen')<CR>")
    keymap.set("n", "<leader>S",
               "<Cmd>call VSCodeNotify('workbench.view.search')<CR>")
    keymap.set("n", "<leader>f",
               "<Cmd>call VSCodeNotify('workbench.view.explorer')<CR>")
    keymap.set("n", "<leader>b",
               "<Cmd>call VSCodeNotify('workbench.action.toggleSidebarVisibility')<CR>")
    keymap.set("n", "<C-h>",
               "<Cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>")
    keymap.set("n", "<C-l>",
               "<Cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>")
    keymap.set("n", "<C-W>",
               "<Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>")
else
    -- ノーマル＆インサートモード
    keymap.set("i", "jj", "<Esc>", {desc = "jj to escape"})
    keymap.set("n", "<leader>s", function()
        require("telescope.builtin").find_files({hidden = true})
    end, {noremap = true, silent = true, desc = "Find files (telescope)"})
    keymap.set("n", "<leader>S", function()
        require("telescope.builtin").live_grep({hidden = true})
    end, {noremap = true, silent = true, desc = "Live grep (telescope)"})
    keymap.set("n", "<leader>f", "<Cmd>Fern .<CR>", {desc = "Open fern"})
    keymap.set("n", "<C-h>", "<Cmd>bprevious<CR>", {desc = "Previous buffer"})
    keymap.set("n", "<C-l>", "<Cmd>bnext<CR>", {desc = "Next buffer"})
    keymap.set("n", "<C-w>", "<Cmd>bdelete<CR>", {desc = "Close buffer"})
end

-- ウィンドウ分割
keymap.set("n", "ss", ":split<Return><C-w>w", {desc = "Horizontal split"})
keymap.set("n", "sv", ":vsplit<Return><C-w>w", {desc = "Vertical split"})

-- ウィンドウ移動
keymap.set("n", "sh", "<C-w>h", {desc = "Move to left window"})
keymap.set("n", "sk", "<C-w>k", {desc = "Move to upper window"})
keymap.set("n", "sj", "<C-w>j", {desc = "Move to lower window"})
keymap.set("n", "sl", "<C-w>l", {desc = "Move to right window"})

-- Emacs風のカーソル移動（インサート）
keymap.set("i", "<C-f>", "<Right>", {desc = "Move right in insert mode"})

-- コピーせず削除
keymap.set("n", "d", '"_d', {desc = "Delete without yanking"})

-- 行頭・行末・高速移動
keymap.set("n", "<S-h>", "0", {desc = "Move to line start"})
keymap.set("n", "<S-l>", "$", {desc = "Move to line end"})
keymap.set("n", "<C-j>", "5j", {desc = "Move down 10 lines"})
keymap.set("n", "<C-k>", "5k", {desc = "Move up 10 lines"})

-- ターミナルモード → ノーマルに戻る
keymap.set("t", "<ESC>", "<C-\\><C-n>", {desc = "Escape terminal mode"})
