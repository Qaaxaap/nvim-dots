-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- 添加全局快捷键映射
local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Ctrl+A 全选
map("n", "<C-a>", "ggVG", { desc = "Select all" })
map("i", "<C-a>", "<Esc>ggVG", { desc = "Select all" })
map("v", "<C-a>", "ggVG", { desc = "Select all" })

-- 也可以使用更简洁的方式
vim.keymap.set({ "n", "i", "v" }, "<C-a>", function()
    vim.api.nvim_command("normal! ggVG")
end, { desc = "Select all" })
