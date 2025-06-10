return {
    "romgrk/barbar.nvim",
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- アイコン表示用
        'lewis6991/gitsigns.nvim' -- オプションで git 状態の表示に使える
    },
    config = function()
        require("bufferline").setup {
            -- 好みの設定はここに追加（例：animation = false 等）
        }

        -- キーマップ設定
        local map = vim.api.nvim_set_keymap
        local opts = {noremap = true, silent = true}

        -- Buffer を閉じる
        map('n', '<leader>e', '<Cmd>BufferClose<CR>', opts)
    end
}
