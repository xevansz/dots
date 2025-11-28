-- install packer if not installed on this machine
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

-- first time startup?
local packer_bootstrap = ensure_packer()

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
  augroup HighlightCursorLineNr
    autocmd!
    autocmd ColorScheme * hi clear CursorLine
    autocmd ColorScheme * highlight CursorLineNr cterm=bold ctermbg=NONE ctermfg=Red
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'
    use 'stevearc/dressing.nvim'

    -- fuzzy finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.5',
        requires = { { 'nvim-lua/plenary.nvim' } },
        config = function() require('zen.plugins.telescope') end
    }

    -- syntax highlighting
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require('zen.plugins.treesitter') end
    }

    -- color scheme
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function() require('zen.plugins.theme') end
    }

    -- pywal colors
--    use { 'AlphaTechnolog/pywal.nvim', as = 'pywal' }

    -- fancier status bar
    use {
        'nvim-lualine/lualine.nvim',
        config = function() require('zen.plugins.lualine') end,
    }

    use {
        'vimwiki/vimwiki',
        config = function() require('zen.plugins.vimwiki') end,
    }

    -- startup screen
    use {
        'goolord/alpha-nvim',
        config = function() require('zen.plugins.alpha') end,
    }

    -- distraction-free writing mode
    use {
        'folke/zen-mode.nvim',
        opt = true,
        cmd = { 'ZenMode' },
        config = function() require('zen.plugins.zen-mode') end
    }

    -- automatically set up the configuration after cloning packer.nvim
    if packer_bootstrap then
        require('packer').sync()
    end
end)
