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
                    maxLineLength = 200,
                    ignore = {'E131', 'E123'}
                },
                jedi = {
                    extra_paths = {}
                }
            }
        }
    }
}

lspconfig.gopls.setup {}
