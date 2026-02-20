-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
-- 修复 C++ namespace 缩进问题
--vim.api.nvim_create_autocmd("FileType", {
--    pattern = "cpp",
--    callback = function()
--        -- 设置正确的缩进规则
--        vim.bo.indentexpr = "cindent"
--        vim.bo.cinoptions = vim.bo.cinoptions .. ":1"
--    end,
--})
--require('matugen').setup()
vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
    pattern = { "*.cpp", "*.h", "*.hpp" },
    callback = function()
        -- 禁用其他缩进引擎
        vim.bo.indentexpr = ""
        vim.bo.smartindent = false

        -- 强制启用 C 缩进
        vim.bo.cindent = true

        -- 关键的 namespace 设置
        vim.bo.cinoptions = vim.bo.cinoptions .. ":1"

        -- 设置缩进键
        vim.bo.indentkeys = "0{,0},0),0],!^F,o,O,e"
    end,
})
