-----------------------------------------------------------
-- Import lua modules
-----------------------------------------------------------
require('plugins')
require('settings')
require('keymaps')

-- Plugin configs
require('plugins.bufferline')
require('plugins.cmp')
require('plugins.Comment')
require('plugins.dashboard')
require('plugins.lspconfig')
require('plugins.lualine')
require('plugins.nvim-autopairs')
require('plugins.nvim-lsp-installer')
require('plugins.nvim-tree')
require('plugins.nvim-treesitter')
require('plugins.nvim-web-devicons')
require('plugins.telescope')

-- Automatically run PackerCompile
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
