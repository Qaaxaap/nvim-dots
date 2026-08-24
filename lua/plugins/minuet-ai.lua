return {
    {
        "milanglacier/minuet-ai.nvim",
        config = function()
            require("minuet").setup({
                provider = "openai_fim_compatible",
                frontend = "virtualtext",
                n_completions = 1,
                context_window = 20480,
                request_timeout = 5,
                throttle = 1500,
                debounce = 600,
                notify = "debug", -- 可临时改为 "debug" 排查

                virtualtext = {
                    auto_trigger_ft = { "lua", "python", "javascript", "typescript", "go", "rust" },
                    keymap = {
                        accept = "<A-l>",
                        accept_line = "<A-j>",
                        accept_n_lines = "<A-k>",
                        next = "<A-2>", -- 避开 LazyVim 默认冲突
                        prev = "<A-1>",
                        dismiss = "<A-e>",
                    },
                },

                provider_options = {
                    openai_fim_compatible = {
                        api_key = "DEEPSEEK_API_KEY",
                        name = "Deepseek",
                        end_point = "https://api.deepseek.com/beta/completions",
                        model = "deepseek-chat", -- 或 "deepseek-coder"
                        optional = {
                            max_tokens = 256,
                            stop = { "\n\n" },
                        },
                    },
                },
            })
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
}
