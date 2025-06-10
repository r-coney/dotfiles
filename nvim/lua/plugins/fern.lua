return {
    "lambdalisue/fern.vim",
    lazy = false, -- 必要に応じて true に変更（例: キーマップやコマンドで遅延読み込み）
    dependencies = {
        "lambdalisue/nerdfont.vim", "lambdalisue/fern-renderer-nerdfont.vim",
        "lambdalisue/glyph-palette.vim"
    },
    config = function()
        -- 設定：nerdfontアイコン表示と隠しファイル表示を有効化
        vim.g["fern#renderer"] = "nerdfont"
        vim.g["fern#default_hidden"] = 1
    end
}
