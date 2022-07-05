local default_opts = { noremap = true, silent = true }

-----------------------------------------------------------
-- Common
-----------------------------------------------------------
-- Use hjkl
-- vim.api.nvim_set_keymap('', '<up>', ':echoe "Use k"<CR>', {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('', '<down>', ':echoe "Use j"<CR>', {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('', '<left>', ':echoe "Use h"<CR>', {noremap = true, silent = false})
-- vim.api.nvim_set_keymap('', '<right>', ':echoe "Use l"<CR>', {noremap = true, silent = false})

-- Switching tabs using Tab or Shift-Tab
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)

-----------------------------------------------------------
-- LSP
-----------------------------------------------------------
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, default_opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, default_opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, default_opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, default_opts)

vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, default_opts)
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, default_opts)
vim.keymap.set('n', 'K', vim.lsp.buf.hover, default_opts)
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, default_opts)
vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, default_opts)
vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, default_opts)
vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, default_opts)
vim.keymap.set('n', '<space>wl', function() print(vim.inspect(vim.lsp.buf.list_workspace_folders())) end, default_opts)
vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, default_opts)
vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, default_opts)
vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, default_opts)
vim.keymap.set('n', 'gr', vim.lsp.buf.references, default_opts)
vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, default_opts)

-----------------------------------------------------------
-- Fn keys: F1 .. F12
-----------------------------------------------------------
-- <F1> No higlights
vim.api.nvim_set_keymap('n', '<F1>', '<cmd>nohl<CR>', default_opts)

-- <F4> Telescope live_grep
vim.api.nvim_set_keymap('n', '<F4>', '<cmd>Telescope live_grep<CR>', default_opts)

-- <F5> Telescope find_files
vim.api.nvim_set_keymap('n', '<F5>', '<cmd>Telescope find_files<CR>', default_opts)

-- <F6> NvimTree
vim.api.nvim_set_keymap('n', '<F6>', '<cmd>NvimTreeToggle<CR>', default_opts)

-- <F8> Tagbar
vim.api.nvim_set_keymap('n', '<F8>', '<cmd>TagbarToggle<CR>', default_opts)
