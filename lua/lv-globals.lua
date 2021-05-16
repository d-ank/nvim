O = {
    auto_close_tree = 0,
    auto_complete = true,
    colorscheme = 'darcula', --this not saving?
    hidden_files = true,
    wrap_lines = false,
    number = true,
    relative_number = true,
    shell = 'bash',

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = {"c", "cpp", "rust", "go", "gomod", "javascript", "jsdoc", "json", "lua", "php", "python", "toml", "tsx", "yaml", "css", "html"},
        ignore_install = {"haskell", "beancount", "c_sharp", "clojure", "erlang", "dart", "fennel", "gdscript", "ledger", "nix", "ocamllex", "ocaml", "ocaml_interface", "turtle", "teal", "vue", "verilog"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = false}
    },

    database = {save_location = '~/.config/nvcode_db', auto_execute = 1},
    python = {
        linter = '',
        -- @usage can be 'yapf', 'black'
        formatter = '',
        autoformat = false,
        isort = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    lua = {
        -- @usage can be 'lua-format'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    sh = {
        -- @usage can be 'shellcheck'
        linter = '',
        -- @usage can be 'shfmt'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    tsserver = {
        -- @usage can be 'eslint'
        linter = '',
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = true, signs = true, underline = true}
    },
    clang = {diagnostics = {virtual_text = true, signs = true, underline = true}},
    -- css = {formatter = '', autoformat = false, virtual_text = true},
    -- json = {formatter = '', autoformat = false, virtual_text = true}
}

DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

