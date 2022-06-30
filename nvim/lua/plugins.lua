-----------------------------------------------------------
-- Install plugins
-----------------------------------------------------------
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    -- Install packer
    use 'wbthomason/packer.nvim'

    -----------------------------------------------------------
    -- Appearance plugins
    -----------------------------------------------------------
    -- Colorscheme
    use 'morhetz/gruvbox'

    -- Information line at the bottom
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons', opt = true},
    }

    -- Buffer line with tabpage integration
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- Beautiful dashboard
    use 'glepnir/dashboard-nvim'

    -----------------------------------------------------------
    -- Navigation
    -----------------------------------------------------------
    -- File Manager
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
          'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly'
    }

    -- Navigation inside the file by classes and functions
    use 'majutsushi/tagbar'

    -- Telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -----------------------------------------------------------
    -- LSP and auto-completion
    -----------------------------------------------------------
    -- Highlight, edit, and navigate code using a fast incremental parsing library
    use 'nvim-treesitter/nvim-treesitter'

    -- Collection of configurations for built-in LSP client
    use 'neovim/nvim-lspconfig'
    use 'williamboman/nvim-lsp-installer'

    -- Auto-completion
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-path'
    use 'saadparwaiz1/cmp_luasnip'
    -- Snippets plugin
    use 'L3MON4D3/LuaSnip'

    -----------------------------------------------------------
    -- Other
    -----------------------------------------------------------
    -- Frames or removes the frame.
    use 'tpope/vim-surround'

    -- Add comments
    use 'numToStr/Comment.nvim'

    -- Auto close parentheses
    use 'windwp/nvim-autopairs'

    -- Translater
    use 'skanehira/translate.vim'

    -- Markdown preview
    use 'iamcco/markdown-preview.nvim'

end)

