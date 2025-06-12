return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.2",
    dependencies = {"nvim-lua/plenary.nvim"},
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                sorting_strategy = "ascending",
                winblend = 4,
                layout_strategy = 'vertical',
                layout_config = {height = 0.9},
                file_ignore_patterns = {"^.git/", "^node_modules/"}
            },
            extensions = {coc = {prefer_locations = false}}
        })
        pcall(telescope.load_extension, "coc")
    end
}
