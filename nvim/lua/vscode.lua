local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end

    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[packadd packer.nvim]])
return require('packer').startup(function(use)
  -- Packer can manage itself
    use 'tpope/vim-commentary'
    use 'wbthomason/packer.nvim'
    use 'cocopon/iceberg.vim'
--    use 'lambdalisue/fern.vim'
--    use 'lambdalisue/nerdfont.vim'
--    use 'lambdalisue/fern-renderer-nerdfont.vim'
--    use 'lambdalisue/glyph-palette.vim'
--    use {
--      "nvim-lualine/lualine.nvim",
--      requires = { "nvim-tree/nvim-web-devicons", opt = true }
--    }
--    use 'nvim-tree/nvim-web-devicons' -- OPTIONAL: for file icons
--    use 'lewis6991/gitsigns.nvim' -- OPTIONAL: for git status
--    use 'romgrk/barbar.nvim'
--    use {'neoclide/coc.nvim', branch='release'}
--    use {
--        'nvim-treesitter/nvim-treesitter',
--        run = ':TSUpdate'
--    }
--    use {
--      'nvim-telescope/telescope.nvim', tag = '0.1.2',
--      requires = { {'nvim-lua/plenary.nvim'} }
--    }
--    use 'dinhhuy258/git.nvim'
end)
