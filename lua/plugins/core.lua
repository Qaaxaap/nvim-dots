return {
    { "Mofiqul/vscode.nvim" },
    {
        "LazyVim/LazyVim",
        opts = {
            colorscheme = "vscode",
        },
    },
    {
        "xeluxee/competitest.nvim",
        dependencies = "MunifTanjim/nui.nvim",
        config = function()
            require("competitest").setup()
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        -- follow latest release.
        version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
        -- install jsregexp (optional!).
        build = "make install_jsregexp",
    },
    {
        "saghen/blink.cmp",
        version = "1.*",
        opts = {
            completion = {
                ghost_text = {
                    enabled = false,
                },
            },
            sources = {
                default = { "lsp", "path", "snippets", "buffer" },
            },
        },
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy",
        priority = 1000,
        opts = {
            transparent_bg = true,
            options = {
                multilines = {
                    enabled = true,
                    always_show = true,
                },
            },
        },
    },
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "mason-org/mason.nvim",
            "mason-org/mason-lspconfig.nvim",
        },
        opts = {
            inlay_hints = {
                enabled = false,
            },
            servers = {
                clangd = {
                    cmd = {
                        "clangd",
                        "--suggest-missing-includes=false",
                        "--background-index=false",
                        "--clang-tidy=false",
                        "--header-insertion=never",
                        "--fallback-style=webkit",
                        "--query-driver=/usr/bin/g++",
                    },
                    init_options = {
                        fallbackFlags = {
                            "-std=c++23",
                            "-Wall",
                            "-Wextra",
                            "-Wshadow",
                            "-Wno-sign-compare",
                        },
                    },
                },
            },
            diagnostics = { virtual_text = false },
        },
    },
    {
        "alex-popov-tech/store.nvim",
        dependencies = { "OXY2DEV/markview.nvim" },
        opts = {},
        cmd = "Store",
    },
    {
        "keaising/im-select.nvim",
        config = function()
            require("im_select").setup({})
        end,
    },
    {
        "ThePrimeagen/vim-be-good",
    },
}
