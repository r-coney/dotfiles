return {
    "neoclide/coc.nvim",
    branch = "release",
    event = {"InsertEnter", "CmdlineEnter"}, -- 起動時に遅延読み込み
    config = function()
        if vim.g.vscode then return end

        -- Diagnostics で signcolumn を常に表示
        vim.opt.signcolumn = "yes"

        local keyset = vim.keymap.set

        -- Backspace チェック関数
        function _G.check_back_space()
            local col = vim.fn.col('.') - 1
            return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~=
                       nil
        end

        -- 補完ナビゲーション (Tab / Shift-Tab)
        local opts = {
            silent = true,
            noremap = true,
            expr = true,
            replace_keycodes = false
        }
        keyset("i", "<TAB>",
               'coc#pum#visible() ? coc#pum#next(1) : v:lua.check_back_space() ? "<TAB>" : coc#refresh()',
               opts)
        keyset("i", "<S-TAB>",
               [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)
        keyset("i", "<CR>",
               [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]],
               opts)

        -- 定義ジャンプ系のキーマップ
        keyset("n", "gd", "<Plug>(coc-definition)", {silent = true})
        keyset("n", "gy", "<Plug>(coc-type-definition)", {silent = true})
        keyset("n", "gi", "<Plug>(coc-implementation)", {silent = true})
        keyset("n", "gr", "<Plug>(coc-references)", {silent = true})
    end
}
