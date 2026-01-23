-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/nvim/snippets/" } })

vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.keymap.set("n", "<F9>", function()
            vim.cmd("w")
            -- 打开终端并立即进入插入模式
            vim.cmd("belowright 15split")
            vim.cmd("terminal cd '%:p:h' && g++ -std=c++23 -O2 '%:t' -o '%:r' && ./'%:r'")
            vim.cmd("startinsert") -- 关键：进入插入模式
        end, { buffer = true, desc = "Compile and run code" })
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "cpp",
    callback = function()
        vim.keymap.set("n", "<F10>", function()
            vim.cmd("w")
            -- 打开终端并立即进入插入模式
            vim.cmd("belowright 15split")
            vim.cmd(
                "terminal cd '%:p:h' && g++ -std=c++23 -O2 -g -fsanitize=address,undefined '%:t' -o '%:r' && ./'%:r'"
            )
            vim.cmd("startinsert") -- 关键：进入插入模式
        end, { buffer = true, desc = "Compile and run code (Debug)" })
    end,
})
vim.api.nvim_create_autocmd("FileType", {
    pattern = "rust",
    callback = function()
        vim.keymap.set("n", "<F9>", function()
            vim.cmd("w")
            -- 打开终端并立即进入插入模式
            vim.cmd("belowright 15split")
            vim.cmd("terminal cd '%:p:h' && rustc --edition=2024 '%:t' && ./'%:r'")
            vim.cmd("startinsert") -- 关键：进入插入模式
        end, { buffer = true, desc = "Compile and run code" })
    end,
})
