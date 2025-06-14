-- ~/.config/nvim/lua/plugins/conform.lua など
return {
    "stevearc/conform.nvim",
    event = {"BufWritePre"},
    config = function()
        require("conform").setup({
            formatters_by_ft = {
                lua = {"stylua"},
                sh = {"shfmt"},
                bash = {"shfmt"},
                zsh = {"shfmt"},
                javascript = {"prettier"},
                typescript = {"prettier"},
                json = {"prettier"},
                yaml = {"prettier"},
                html = {"prettier"},
                css = {"prettier"},
                scss = {"prettier"},
                markdown = {"prettier"},
                dockerfile = {"prettier"}
            },
            -- 保存時に自動でフォーマット
            format_on_save = true
        })
    end
}
