local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options

-- Markdown preview
g.mkdp_open_to_the_world = 1
g.mkdp_open_ip = '127.0.0.1'
g.mkdp_port = 8080
cmd [[
    function! g:EchoUrl(url)
        :echo a:url
    endfunction
    let g:mkdp_browserfunc = 'g:EchoUrl'
]]

-- Translate from Russia to English
g.translate_source = 'ru'
g.translate_target = 'en'

-- Tagbar settings
g.tagbar_compact = 1
g.tagbar_sort = 0

-----------------------------------------------------------
-- Common
-----------------------------------------------------------
opt.number = true                   -- Enable line numbering
opt.relativenumber = true           -- Enable relative line numbering
opt.scrolloff = 10                  -- Lines scroll off
opt.undofile = true                 -- The possibility of rolling back
opt.splitright = true               -- Right vertical split
opt.splitbelow = true               -- Below horizontal split
opt.mouse = 'a'                     -- Enable mouse
opt.ignorecase = true               -- Case insensitive for search

-----------------------------------------------------------
-- Color scheme
-----------------------------------------------------------
opt.termguicolors = true            --  24-bit RGB colors
cmd [[colorscheme gruvbox]]
-- cmd [[colorscheme onedark]]

-----------------------------------------------------------
-- Tabs and margins
-----------------------------------------------------------
opt.expandtab = true                -- Use spaces instead of tabs
opt.shiftwidth = 4                  -- Shift 4 spaces when tab
opt.tabstop = 4                     -- 1 tab == 4 spaces
opt.smartindent = true              -- Autoindent new lines

-- Don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- 2 spaces for selected filetypes
cmd [[autocmd FileType xml,css,yml,yaml setlocal shiftwidth=2 tabstop=2]]

-- Tabs instead of spaces for selected filetypes
cmd [[autocmd FileType go setlocal noexpandtab]]

-----------------------------------------------------------
-- Usefull
-----------------------------------------------------------
-- Highlighted yank
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=300}
augroup end
]], false)
