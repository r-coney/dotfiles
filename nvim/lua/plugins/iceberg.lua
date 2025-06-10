return {
    "cocopon/iceberg.vim",
    lazy = false, -- カラースキームは常に読み込む
    priority = 1000, -- 他のプラグインよりも先に読み込む（色が壊れないように）
    config = function()
        vim.opt.background = "dark" -- ダークテーマとして設定
        vim.cmd.colorscheme("iceberg") -- カラースキームを適用
    end
}
