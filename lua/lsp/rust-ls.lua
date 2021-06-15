require'lspconfig'.rust_analyzer.setup{
    cmd = {DATA_PATH .. "/lspinstall/rust/rust-analyzer"},
    on_attach = require'lsp'.common_on_attach,
    settings = {
        rust_analyzer = {
            cargo = {
                loadOutDirsFromCheck = true;
                runBuildScripts = true;
            },
            procMacros = {
                enable = true;
            }
        }
    }
}

