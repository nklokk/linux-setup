local cmd = vim.cmd             -- execute Vim commands
local exec = vim.api.nvim_exec  -- execute Vimscript
local g = vim.g                 -- global variables
local opt = vim.opt             -- global/buffer/windows-scoped options

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

-----------------------------------------------------------
-- Plugins
-----------------------------------------------------------
require('lualine').setup {
    options = { theme = 'gruvbox' }
}

require('bufferline').setup {
    options = {
	    offsets = {
            {
                filetype = 'NvimTree',
                text = 'File Explorer',
                text_align = 'left'
            }
        },
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            local s = ' '
            for e, n in pairs(diagnostics_dict) do
                local sym = e == 'error' and ' ' or (e == 'warning' and ' ' or '' )
                s = s .. n .. sym
            end
            return s
        end
    }
}

require('nvim-tree').setup {}

require('nvim-web-devicons').setup {}

require('telescope').setup {}

require('nvim-treesitter.configs').setup {
    ensure_installed = { 'python', 'lua' },
    highlight = {
        enable = true,
    },
    indent = {
        enable = true
    }
}

require('nvim-lsp-installer').setup {
    automatic_installation = true,
    ui = {
        icons = {
            server_installed = '✓',
            server_pending = '➜',
            server_uninstalled = '✗'
        }
    }
}

local lspconfig = require('lspconfig')
lspconfig.sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim', 'use'},
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            telemetry = {
                enable = false,
            }
        }
    }
}

lspconfig.pylsp.setup {
    settings = {
        pylsp = {
            configurationSources = {'flake8'},
            plugins = {
                flake8 = {
                    enabled = true,
                    maxLineLength = 200
                }
            }
        }
    }
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'luasnip' }
    },
    mapping = cmp.mapping.preset.insert {
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }
}

require('Comment').setup {}

local db = require('dashboard')

db.custom_header = {
    ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
    ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
    ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
    ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
    ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
    ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
}

db.custom_center = {
    {icon = '  ', desc = 'Find  File                              ', action = 'Telescope find_files', shortcut = '<F5>'},
    {icon = '  ', desc = 'Find  Word                              ', action = 'Telescope live_grep', shortcut = '<F4>'},
}

require('nvim-autopairs').setup {}

