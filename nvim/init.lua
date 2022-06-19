-----------------------------------------------------------
-- Import lua modules
-----------------------------------------------------------
require('plugins')
require('settings') 
require('keymaps')

-- Automatically run PackerCompile 
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

