return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local status, treesitter = pcall(require, "nvim-treesitter.configs")
        if not status then return end

        treesitter.setup({
            ensure_installed = {
                "vim", "dockerfile", "typescript", "tsx", "javascript", "json",
                "lua", "gitignore", "bash", "markdown", "css", "scss", "yaml",
                "sql", "html"
            },
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = {}
            },
            indent = {enable = true, disable = {"html"}},
            autotag = {enable = true}
        })
    end
}
